# Enable permissive behaviour on SELinux

setenforce Permissive
sed -i 's/SELINUX=disabled/SELINUX=permissive/g' /etc/selinux/config