#!/usr/bin/env sh

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'

# Menampilkan isi file .pidfile
cat .pidfile

# Memeriksa apakah file .pidfile ada
if [ -f .pidfile ]; then
    set -x
    kill $(cat .pidfile)
    rm .pidfile
else
    echo "File .pidfile not found. The process may have already terminated."
fi