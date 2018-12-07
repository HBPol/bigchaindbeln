#!/bin/bash
sudo apt install mysql-server
# set up MySQL server (for production env; not implemented here)
	# sudo mysql_install_db
	# sudo mysql_secure_installation
# log in MySQL server as
sudo mysql
	# create new sql user and database:
	# MariaDB [(none)]> CREATE DATABASE bceln;
	# MariaDB [(none)]> CREATE USER 'django'@'localhost' IDENTIFIED BY 'django'
	# MariaDB [(none)]> GRANT ALL PRIVILEGES ON bceln.* to 'django'@'localhost';
	# MariaDB [(none)]> FLUSH PRIVILEGES;