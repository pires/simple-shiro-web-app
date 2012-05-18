simple-shiro-web-app
====================

A simple proof-of-concept of Shiro authentication with JDBC Realm and MySQL.

## Prerequisites ##
- JDK 6
- Maven 3.0.3 or newer
- Glassfish 3.1.1 or newer

## Configure MySQL database ##

Run the following commands:  

_mysql -u root -p_  

_create database simple_shiro_web_app;_  

_grant all privileges on simple_shiro_web_app.* to 'root'@'localhost' identified by '123qwe';_

_flush privileges;_

Now, populate the database with the script provided:  

_mysql -u root -p123qwe simple_shiro_web_app < pop_db.sql_

## Build WAR and deploy to Glassfish ##

In order to build a WAR package, run the following command:  

_mvn clean package_

Then, deploy the resulting _target/simple-shiro-web-app-0.1.war_ to your Glassfish domain instance.

## Test ##

Point your browser to _http://localhost/web-app-0.1/_
