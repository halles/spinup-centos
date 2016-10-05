# Makes and adds a swapfile

args=("$@")
swap_size=${args[0]}

fallocate -l ${swap_size}G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
printf "\n/swapfile   swap    swap    sw  0   0\n" >> /etc/fstab
