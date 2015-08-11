cd ~
curl -o spinup.tar.gz http://code.wktapp.com/devops/spinup-centos/repository/archive?ref=master
tar xfz spinup.tar.gz
rm spinup.tar.gz
cd spinup-centos.git
./spinup-db.sh