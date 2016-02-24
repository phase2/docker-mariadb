![logo](https://www.phase2technology.com/wp-content/uploads/2015/06/logo-retina.png)

## Description

This mariadb image is a MySQL compliant database image with configuration through a collection of environment variables detailed below.

## How to use this image

Starting a MariaDB instance is simple:

$ docker run --name some-mariadb -e MYSQL_PASS=my-secret-pw -d phase2/mariadb

... where some-mariadb is the name you want to assign to your container, my-secret-pw is the password to be set for the MySQL root user

## Using a custom MySQL configuration file
The MariaDB startup configuration is specified in the file /etc/mysql/my.cnf, and that file in turn includes any files found in the etc/mysql/conf.d directory that end with .cnf. Settings in files in this directory will augment and/or override settings in /etc/mysql/my.cnf. If you want to use a customized MySQL configuration, you can create your alternative configuration file in a directory on the host machine and then mount that directory location as /etc/mysql/conf.d inside the mariadb container.

If /my/custom/config-file.cnf is the path and name of your custom configuration file, you can start your mariadb container like this note that only the directory path of the custom config file is used in this command):

$ docker run --name some-mariadb -v /my/custom:/etc/mysql/conf.d -e MYSQL_PASS=my-secret-pw -d phase2/mariadb

This will start a new container some-mariadb where the MariaDB instance uses the combined startup settings from /etc/mysql/my.cnf and /etc/mysql/conf.d/config-file.cnf, with settings from the latter taking precedence.


## Environment Variables

When you start the mariadb image, you can adjust the configuration of the instance by passing one or more environment variables on the docker run command-line or via your docker-compose manifest file.

### MYSQL_PASS

This will be the password that is set for the user named **admin**.  The root user does not have a password and allow local connections only.

### MYSQL_DATABASE

This is the name of the database to be created when the container starts

### MYSQL_EXPIRE_LOGS_DAYS

Default: 10

### MYSQL_MAX_ALLOWED_PACKET   

Default: 16M

### MYSQL_MAX_CONNECTIONS      

Default: 10

### MYSQL_QUERY_CACHE_LIMIT    

Default: 1M

### MYSQL_QUERY_CACHE_SIZE     

Default: 16M

### MYSQL_SLOW_QUERY_LOG      

Default: 0

By default the slow query log is disabled

### MYSQL_LONG_QUERY_TIME     

Default: 10 (seconds)

### MYSQL_LOG_QUERY_NO_INDEX  

Default: 0

By default do not log queries that dont use an index

