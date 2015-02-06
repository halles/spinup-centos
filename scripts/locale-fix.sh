printf "== Corrige un error por no tener locale definido al momento de conectarse por ssh\n\n"

echo 'LC_ALL=C' >> /etc/environment