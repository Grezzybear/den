#!/bin/bash

# Make users and group
sudo useradd pihole -u 11003
sudo groupadd traffic-control -g 11000
sudo usermod -a -G traffic-control pihole

# Make directories
sudo mkdir -pv pihole

# Set permissions
sudo chown -R pihole:traffic-control pihole

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
