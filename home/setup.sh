#!/bin/bash

# Make users and group
sudo useradd homeassistant -u 15001
sudo groupadd home -g 15000
sudo usermod -a -G mediacenter homeassistant

# Make directories
sudo mkdir -pv data/

# Set permissions
sudo chown -R homeassistant:home data/

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
