#!/bin/bash

#Waits until MariaDB is ready
while ! nc -z mariadb 3306; do
    echo 'Waiting for MariaDB...'
    sleep 1
done

cd /var/www/html

wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root --skip-check

# Install WordPress if not installed
if ! wp core is-installed --allow-root; then
    wp core install --path=/var/www/html --url=${DOMAIN_NAME} --title="42 INCEPTION josu!" --admin_name=${WP_ADMIN_USER} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="jzubizar@student.42urduliz.com" --skip-email --allow-root
fi