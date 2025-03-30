#!/bin/bash

# Make users and group
sudo useradd personal-wiki -u 13001
sudo groupadd wiki -g 13000
sudo usermod -a -G wiki personal-wiki

# Make directories
sudo mkdir -pv data

# Set permissions
sudo chown -R personal-wiki:wiki data

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
