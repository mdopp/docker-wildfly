ojdbc7-12.1.0.1.jar belongs to Oracle and stays under the Oracle Technology Network Development and Distribution License Terms. 

If you want to use it, please grep your own version from 

http://www.oracle.com/technetwork/database/features/jdbc/jdbc-drivers-12c-download-1958347.html

and path the timezone problem with a simple patch in the defaultConnectionProperties.properties inside the jar file.
```
oracle.jdbc.timezoneAsRegion=false
```
