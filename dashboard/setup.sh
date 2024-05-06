#!/bin/bash

# Make users and group
sudo useradd homepage -u 12001
sudo groupadd dashboard -g 12000
sudo usermod -a -G dashboard homepage

# Make directories
sudo mkdir -pv config/{homepage}-config

# Set permissions
sudo chown -R homepage:dashboard config/homepage-config

# set our base env values
echo "UID=$(id -u)" >> .env
echo "BASE=$(pwd)" >> .env
"HOMEPAGE-UID=12001" >> .env
"DASHBOARD-GID=12000" >> .env
"TZ=Etc/UTC" >> .env
