yum install -y gcc make kernel-devel

mkdir VBoxLinuxAdditions
mount /dev/cdrom VBoxLinuxAdditions
cd VBoxLinuxAdditions
./VBoxLinuxAdditions.run install --force
cd ..
umount /dev/cdrom
rmdir VBoxLinuxAdditions