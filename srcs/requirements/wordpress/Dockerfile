FROM debian:bullseye

COPY ./tools/setup.sh /tmp
RUN chmod +x /tmp/setup.sh

#Installation php-fpm, php-mysql, curl, netcat
RUN apt update && apt install -y php-fpm php-mysql curl netcat-openbsd

#Instalation of wp-cli (https://make.wordpress.org/cli/handbook/guides/installing/) interfaz de comandos de wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /var/www && mkdir /var/www/html

WORKDIR /var/www/html

RUN sed -i 's/^pid = \/run\/php\/php7\.4-fpm\.pid$/pid = \/var\/run\/php-fpm7.4.pid/' /etc/php/7.4/fpm/php-fpm.conf

#Download wordpress and creat config file in /var/www/html
RUN wp core download --locale=es_ES --allow-root
#Copy the php-fpm configuration file with the listening in 9000 command
COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

#exec Wordpress instalation and php-fpm service to listen
CMD [ "sh", "-c", "/tmp/setup.sh && /usr/sbin/php-fpm7.4 -F" ]