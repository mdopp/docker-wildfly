#!/bin/bash

for f in $(find /opt/jboss/wildfly/standalone/deployments -name '*.war') ; do
	while [ ! -f $f.deployed ] ;
	do
		if [ -f $f.failed ] ; then $JBOSS_HOME/bin/jboss-cli.sh --connect command=:shutdown; echo "Service $f konnte nicht eingespielt werden."; exit 1; fi
		
		echo "Warte das $f deployed ist."
		sleep 1
	done
	echo "$f deployed."
done
echo "Services sind deployed."
