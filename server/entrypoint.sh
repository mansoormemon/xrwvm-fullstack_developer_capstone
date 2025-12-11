#!/bin/sh

echo "Making migrations and migrating the database. "

chown 1000:1000 /app
chown 1000:1000 /app/db.sqlite3
chmod 775 /app
chmod 664 /app/db.sqlite3

python manage.py makemigrations --noinput || true
python manage.py migrate --noinput
python manage.py collectstatic --noinput

exec "$@"
