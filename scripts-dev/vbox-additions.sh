mkdir VBoxLinuxAdditions
mount /dev/cdrom VBoxLinuxAdditions
cd VBoxLinuxAdditions
./VBoxLinuxAdditions.run
cd ..
umount /dev/cdrom
rmdir VBoxLinuxAdditions