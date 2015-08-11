# Para Montajes NFS

yum -y install nfs-utils nfs-utils-lib
systemctl enable nfs-server
systemctl enable rpcbind
systemctl start rpcbind
systemctl start nfs-server
mkdir /temp-nfs-mounts