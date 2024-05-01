#!/bin/bash

# Make users and group
sudo useradd wireguard -u 11001
sudo useradd nginx -u 11002
sudo groupadd traffic-control -g 11000
sudo usermod -a -G traffic-control wireguard
sudo usermod -a -G traffic-control nginx

# Make directories
sudo mkdir -pv {nginx,wireguard}

# Set permissions
sudo chown -R wireguard:traffic-control wireguard
sudo chown -R nginx:traffic-control nginx

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
