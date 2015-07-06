# Instalacion de MongoDB
# Centos viene por defecto con una version antigua de MongoDB
# Reempalzar repositorio con versión oficial

cp config-dev/yum.res.d/mongodb-org-3.0.repo /etc/yum.res.d/mongodb-org-3.0.repo

sudo yum install -y mongodb-org

systemctl enable mongod.service
systemctl start mongod.service