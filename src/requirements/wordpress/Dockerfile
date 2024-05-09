FROM debian:bookworm-backports

# Set environment variables
#ENV MYSQL_DATABASE=wordpress
#ENV MYSQL_USER=jzubizar
#ENV MYSQL_PASSWORD=1234
#ENV MYSQL_ROOT_PASSWORD=root1234
#ENV MYSQL_HOST=mariadb
#ENV DOMAIN_NAME=jzubizar.42.fr
#ENV WP_ADMIN_USER=jzubizar
#ENV WP_ADMIN_PASSWORD=1234

COPY ./tools/setup.sh /tmp
RUN chmod +x /tmp/setup.sh

#Installation php-fpm, php-mysql, curl, netcat
RUN apt update && apt install -y php-fpm php-mysql curl netcat-openbsd

#Instalation of wp-cli (https://make.wordpress.org/cli/handbook/guides/installing/) interfaz de comandos de wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /var/www && mkdir /var/www/html

WORKDIR /var/www/html

RUN rm -rf *

#Download wordpress and creat config file in /var/www/html
RUN wp core download --locale=es_ES --allow-root \
&& wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root --skip-check

#Copy the php-fpm configuration file with the listening in 9000 command
COPY ./conf/www.conf  /etc/php/8.2/fpm/pool.d/

EXPOSE 9000

#exec Wordpress instalation and php-fpm service to listen
CMD [ "sh", "-c", "/tmp/setup.sh && /usr/sbin/php-fpm8.2 -F" ]