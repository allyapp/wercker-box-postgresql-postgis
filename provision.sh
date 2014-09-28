#!/usr/bin/env sh

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo aptitude update -y
sudo aptitude install -y  postgresql-9.3 postgresql-9.3-postgis-2.1
echo "postgres:wercker" | sudo chpasswd
sudo su postgres - -c 'echo "CREATE DATABASE werckerdb1;" | psql'
