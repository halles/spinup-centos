# Para Montajes NFS

yum -y install nfs-utils nfs-utils-lib
chkconfig nfs on 
service rpcbind start
service nfs start
mkdir /temp-nfs-mounts