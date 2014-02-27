# Instalacion de MySQL

yum -y install mysql mysql-server
chkconfig --level 2345 mysqld on
service mysqld start

/usr/bin/mysqladmin -u root password 'aisoudh9aspnda9sdpjlasd'

# Instalacion de phpMyAdmin

yum -y install phpmyadmin