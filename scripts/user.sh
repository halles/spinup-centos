ssh_username=${args[0]}
ssh_password=${args[1]}

# Creación del Usuario de Control

SSH_DIR=/home/$ssh_username/.ssh
SSH_AUTHORIZED_KEYS=$SSH_DIR/authorized_keys
SSH_HASHED_PASSWORD=$(openssl passwd -1 $ssh_password)

adduser --password $SSH_HASHED_PASSWORD $ssh_username

sudo -u $ssh_username mkdir $SSH_DIR
sudo -u $ssh_username chmod 700 $SSH_DIR
sudo -u $ssh_username touch $SSH_AUTHORIZED_KEYS
#sudo -u $ssh_username echo $ssh_key > SSH_AUTHORIZED_KEYS
sudo -u $ssh_username chmod 600 $SSH_AUTHORIZED_KEYS

usermod -G10 $ssh_username