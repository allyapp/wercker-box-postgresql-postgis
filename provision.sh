#!/usr/bin/env sh

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo aptitude update -y
sudo aptitude install -y  postgresql-9.3 postgresql-9.3-postgis-2.1
echo "postgres:wercker" | sudo chpasswd
sudo su postgres - -c 'echo "CREATE DATABASE werckerdb1;" | psql'
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/*/main/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf
echo "host    all             all             ::1/128               md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf
sudo service postgresql restart
