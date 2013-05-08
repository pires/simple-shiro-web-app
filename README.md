simple-shiro-web-app
====================

A simple proof-of-concept of Shiro authentication with Jetty and JDBC (MySQL) Realm.

## Prerequisites ##
- JDK 6
- Maven 3.0.3 or newer

## Configure MySQL database ##

Run the following commands:  
```
mysql -u root -p
create database simple_shiro_web_app;  
grant all privileges on simple_shiro_web_app.* to 'root'@'localhost' identified by '123qwe';
flush privileges;
```

Now, populate the database with the script provided: 
```
mysql -u root -p123qwe simple_shiro_web_app < pop_db.sql
```

## Test ##
In order to build a WAR package, run the following command:  
```
mvn clean jetty:run
```
Point your browser to _http://localhost:9090_