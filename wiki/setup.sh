#!/bin/bash

# Make users and group
sudo useradd personal-wiki -u 13001
sudo useradd personal-wiki-db -u 13002
sudo groupadd wiki -g 13000
sudo usermod -a -G wiki personal-wiki
sudo usermod -a -G wiki personal-wiki-db

# Make directories
sudo mkdir -pv postgresql
sudo mkdir -pv data/wiki

# Set permissions
sudo chown -R personal-wiki-db:wiki postgresql
sudo chown -R personal-wiki:wiki data/wiki

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
echo "DB_TYPE=postgres" >> .env
echo "DB_HOST=wiki-personal-db" >> .env
echo "DB_PORT=\"5432\"" >> .env

echo "Enter Wiki Admin Email:"
read -r ADMIN_EMAIL
echo "ADMIN_EMAIL=$ADMIN_EMAIL" >> .env
echo "Enter Wiki Admin Password:"
read -r ADMIN_PASS
echo "ADMIN_PASS=$ADMIN_PASS" >> .env
echo "Enter Wiki Port:"
read -r PORT
echo "PORT=\"$PORT\"" >> .env
echo "Enter Database User:"
read -r DB_USER
echo "DB_USER=$DB_USER" >> .env
echo "POSTGRES_USER=$DB_USER" >> .env
echo "Enter Database Password:"
read -r DB_PASS
echo "DB_PASS=$DB_PASS" >> .env
echo "POSTGRES_PASSWORD=$DB_PASS" >> .env
echo "Enter Database Name:"
read -r DB_NAME
echo "DB_NAME=$DB_NAME" >> .env
echo "POSTGRES_DB=$DB_NAME" >> .env
