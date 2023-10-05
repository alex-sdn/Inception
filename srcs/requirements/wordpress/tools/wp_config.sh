#!/bin/sh

sleep 12

# check if config file exists
if [ -f ./wp-config.php ]
then
	echo "CONFIG OK"
else
	echo "CREATING CONFIG"
	wp config create --allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=mariadb:3306 \
			--path='/var/www/wordpress'
	wp core install --allow-root \
			--path="/var/www/wordpress" \
			--url=asadanow.42.fr \
			--title=inception42 \
			--admin_user=boss \
			--admin_password=$WP_PASSWORD_1 \
			--admin_email=alexsdnwcz@gmail.com --skip-email
	wp user create user2 alexsdnwcz2@gmail.com --user_pass=$WP_PASSWORD_2 --allow-root --path="/var/www/wordpress"
	echo "CONFIG READY"
fi

# check if php folder exists
if [ -d /run/php ]
then
	echo "FOLDER OK"
else
	mkdir /run/php
fi

/usr/sbin/php-fpm7.3 -F
