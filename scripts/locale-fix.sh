printf "== Corrige un error por no tener locale definido al momento de conectarse por ssh\n\n"

echo 'LC_ALL=C' >> /etc/environment


## Refs
# http://ibohm.blogspot.com/2012/03/how-to-fix-warning-setlocale-lcctype.html