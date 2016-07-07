# docker-wildfly
============================
An Wildfly image based on ubuntu, which also includes a patched version of the ojdbc driver for Oracle XE

Includes
- ojdbc7 driver with a timezone patch, as Oracle XE has a shortend list of timezones
- wildfly 10

### Installation(with Ubuntu 16.04)
```
docker pull teek/wildfly
```

Run with 1521 port opened:
```
docker run -d -p 8080:80 teek/wildfly
```

Run this, if you need access to the console:
```
docker exec -it {containername} /bin/bash 
```

If you use this file along with teek/oracle-xe-and-flyway you could create a startup script, that is waiting for the database to be ready for connections
```
while [ ! -f /dbstatus/.ready ] ;
do
      sleep 1
      echo "Wait for database to be ready."
done
```

If you need to wait for all war files to be deployed, the following statement at startup could be helpfull.
```
(for f in $(find /opt/jboss/wildfly/standalone/deployments -name '*.war') ; do
	while [ ! -f $f.deployed ] ;
	do
		if [ -f $f.failed ] ; then $JBOSS_HOME/bin/jboss-cli.sh --connect command=:shutdown; echo "Service $f could not be deployed. Shutting down."; exit 1; fi
		
		echo "Wait for $f to be deployed."
		sleep 1
	done
	echo "$f deployed."
done
echo "Services are deployed."
) &

# wildfly starten
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0
```
