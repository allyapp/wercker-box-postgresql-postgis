#!/usr/bin/env sh

echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -c | awk '{print $2}'`-pgdg main" >/etc/apt/sources.list.d/pgdg.list
sudo aptitude install -y postgresql-9.3 postgresql-9.3-postgis-2.1
echo "wercker" | passwd postgres --stdin
PGPASSWORD=werckerdb1 createdb -U postgres
