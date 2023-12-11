#!/bin/bash
#set -eux

service mariadb start;

# log into MariaDB as root and create database and the user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

#mysqladmin -u root shutdown
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
mysql -uroot -p $SQL_ROOT_PASSWORD $SQL_DATABASE < /usr/local/bin/wordpress.sql

exec mysqld_safe

#print status
echo "MariaDB database and user were created successfully! "