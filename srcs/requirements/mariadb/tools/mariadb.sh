#!/bin/sh

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
sleep 1

mysql -u root -p"$SQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
sleep 1

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
