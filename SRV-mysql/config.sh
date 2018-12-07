#!/bin/bash
sudo apt install mysql-server
# set up MySQL server (for production env; not implemented here)
	# sudo mysql_install_db
	# sudo mysql_secure_installation
# log in MySQL server as
sudo mysql
	# create new sql user and database:
	# MariaDB [(none)]> CREATE DATABASE bceln;
	# MariaDB [(none)]> CREATE USER 'django'@'localhost' IDENTIFIED BY 'django';
	# MariaDB [(none)]> GRANT ALL PRIVILEGES ON bceln.* to 'django'@'localhost';
	# MariaDB [(none)]> FLUSH PRIVILEGES;

# type this to know which port the server is runnin on
# > show global variables like 'port%';

# we need remote client access
# edit the configuration file /etc/mysql/mariadb.conf.d/50-server.cn
# comment bind-address		= 127.0.0.1 (line 29)
# restart service: sudo service mysql restart