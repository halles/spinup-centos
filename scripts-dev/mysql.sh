args=("$@")
mysql_root_password=${args[0]}

# Instalacion de MySQL
# La instalación debe hacerse desde el repositorio de la comunidad
# ya que CentOS 7 usa MariaDB por defecto y Longview todavía no es
# compatible con MariaDB

yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql mysql-server
systemctl enable mysqld.service
systemctl stop mysqld.service

# Añadir usuario root sin password para conectarse desde cualquier host

systemctl start mysqld.service
mysql -u root -e "CREATE USER 'root'@'%';GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0; FLUSH PRIVILEGES;"
systemctl stop mysql.service

# Configuración por defecto

cp config-dev/my.cnf /etc/my.cnf