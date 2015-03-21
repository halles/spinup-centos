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