FROM debian:bookworm-backports
#FROM debian:bullseye

# Set environment variables
#ENV MYSQL_DATABASE=wordpress
#ENV MYSQL_USER=jzubizar
#ENV MYSQL_PASSWORD=1234
#ENV MYSQL_ROOT_PASSWORD=root1234

#Install and start mariadb
#RUN rm -rf /var/lib/mysql/*
RUN apt-get update && apt-get install -y mariadb-server
RUN service mariadb start

COPY ./conf/*  /tmp/

RUN chmod +x /tmp/mariadb.sh
RUN chmod +x /tmp/init.sh
RUN /tmp/init.sh

# Change to 'mysql' user
USER mysql

#Set the database and user config file and start the mariadb daemon service running the init file created by sh
CMD [ "sh", "-c", "./tmp/mariadb.sh > /tmp/mariadb.sql && mysqld --init-file=/tmp/mariadb.sql"]

