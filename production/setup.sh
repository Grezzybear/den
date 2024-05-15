#!/bin/bash

# Make users and group
sudo useradd prod-wiki -u 14001
sudo useradd prod-wiki-db -u 14002
sudo useradd nextcloud -u 14003
sudo useradd nextcloud-db -u 14004
sudo groupadd production -g 14000
sudo usermod -a -G production prod-wiki
sudo usermod -a -G production prod-wiki-db
sudo usermod -a -G production nextcloud
sudo usermod -a -G production nextcloud-db

# Make directories
sudo mkdir -p secrets
sudo mkdir -pv nextcloud/html
sudo mkdir -pv nextcloud/postgresql

# Set permissions
sudo chown -R $(id -un):production secrets/
sudo chown -R nextcloud-db:production nextcloud/postgresql
sudo chown -R nextcloud:production nextcloud/html

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env

echo "Enter Nextcloud Admin User:"
read -r NEXTCLOUD_USER
echo "$NEXTCLOUD_USER" >> secrets/nextcloud_admin_user.txt
echo "Enter Nextcloud Admin Password:"
read -r NEXTCLOUD_PASS
echo "$NEXTCLOUD_PASS" >> secrets/nextcloud_admin_password.txt
echo "Enter Postgres DB User:"
read -r PG_DB_USER
echo "$PG_DB_USER" >> secrets/postgres_user.txt
echo "Enter Postgres DB Password:"
read -r PG_DB_PASS
echo "$PG_DB_PASS" >> secrets/postgres_password.txt
echo "Enter Postgres DB Name:"
read -r PG_DB
echo "$PG_DB" >> secrets/postgres_db.txt