# Creacion del Usuario Worker

WORKER_DIR=/home/$worker_username
WORKER_SSH_DIR=WORKER_DIR/.ssh
WORKER_AUTHORIZED_KEYS=WORKER_SSH_DIR/authorized_keys

WORKER_SITES=WORKER_DIR/sites

WORKER_HASHED_PASSWORD=$(openssl passwd -1 $worker_password)

adduser --password $WORKER_HASHED_PASSWORD --shell /sbin/nologin $worker_username

sudo -u $worker_username mkdir WORKER_SSH_DIR
sudo -u $worker_username chmod 700 WORKER_AUTHORIZED_KEYS

# @ TO DO 
# Creación de Servicio de Deploy Keys Temporales
# Creacion de Script que instale la deploy key en el usuario


#Creacion del directorio web inicial

sudo -u $worker_username mkdir WORKER_SITES
sudo -u $worker_username chmod 750 WORKER_SITES
sudo -u $worker_username chmod 750 WORKER_DIR
sudo -u $worker_username mkdir WORKER_SITES/$cluster_hostname
sudo -u $worker_username mkdir WORKER_SITES/$cluster_hostname/www
sudo -u $worker_username mkdir WORKER_SITES/$cluster_hostname/logs