#!/bin/bash

# Make users and group
sudo useradd homeassistant -u 15001
sudo useradd esphome -u 15002
sudo groupadd home -g 15000
sudo usermod -a -G home homeassistant
sudo usermod -a -G home esphome

# Make directories
sudo mkdir -pv config/{homeassistant,esphome}-config

# Set permissions
sudo chown -R homeassistant:home config/homeassistant-config
sudo chown -R esphome:home config/esphome-config

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
