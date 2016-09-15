fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
printf "\n/swapfile   swap    swap    sw  0   0\n" >> /etc/fstab
