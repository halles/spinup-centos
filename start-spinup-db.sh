cd ~
curl -o spinup.tar.gz https://codeload.github.com/halles/spinup-centos/tar.gz/master
tar xfz spinup.tar.gz
rm spinup.tar.gz
mv spinup-centos-master spinup-centos
cd spinup-centos
./spinup-db.sh