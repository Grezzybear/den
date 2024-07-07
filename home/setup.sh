#!/bin/bash

# Make users and group
sudo useradd homeassistant -u 15001
sudo useradd esphome -u 15002
sudo useradd nginxhome -u 15003
sudo groupadd home -g 15000
sudo usermod -a -G home homeassistant
sudo usermod -a -G home esphome
sudo usermod -a -G home nginxhome

# Make directories
sudo mkdir -pv config/{homeassistant,esphome,nginxhome}-config
sudo mkdir -pv config/letsencrypt

# Set permissions
sudo chown -R homeassistant:home config/homeassistant-config
sudo chown -R esphome:home config/esphome-config
sudo chown -R nginxhome:home config/nginxhome-config
sudo chown -R nginxhome:home config/letsencrypt

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
