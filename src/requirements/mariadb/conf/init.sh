#!/bin/bash

#Change MariaDB ownership of the data directory
chown -R mysql /var/lib/mysql

#Coment unnecesary lines in the configuration file
sed -i "s/^bind-address\s*=.*$/#Kbind-address = 127.0.0.1/"  /etc/mysql/mariadb.conf.d/50-server.cnf

#Change port to 3306 and socket ubication
    #is change in socket necessary?The /run directory is a symbolic link to /var/run on most modern Linux systems. They both refer to the same location, which is a temporary filesystem (tmpfs) that stores volatile runtime data. It's cleared at each reboot.
sed -i 's/^socket\s*=.*/socket=\/var\/run\/mysqld\/mysqld.sock/' /etc/mysql/mariadb.cnf
sed -i "s/#\?\s*port=.*/port=3306/" /etc/mysql/mariadb.cnf

service mariadb restart