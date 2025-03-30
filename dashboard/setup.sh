#!/bin/bash

# Make users and group
sudo useradd homepage -u 12001
sudo groupadd dashboard -g 12000
sudo usermod -a -G dashboard homepage

# Make directories
sudo mkdir -pv config/homepage-config
sudo mkdir -pv images/

# Set permissions
sudo chown -R homepage:dashboard config/homepage-config

# set our base env values
echo "UID=$(id -u)" >> .env
echo "BASE=$(pwd)" >> .env
echo "HOMEPAGE-UID=12001" >> .env
echo "DASHBOARD-GID=12000" >> .env
echo "TZ=Etc/UTC" >> .env
echo "HOMEPAGE_ALLOWED_HOSTS=" >> .env
