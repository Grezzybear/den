#!/bin/bash

# Make users and group
sudo useradd homeassistant -u 15001
sudo groupadd home -g 15000
sudo usermod -a -G home homeassistant

# Make directories
sudo mkdir -pv config/{homeassistant,esphome}-config

# Set permissions
sudo chown -R homeassistant:home config/homeassistant-config

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
