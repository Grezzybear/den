#!/bin/bash

# Make users and group
sudo useradd homeassistant -u 15001
sudo useradd mealie -u 15002
sudo groupadd home -g 15000
sudo usermod -a -G home homeassistant
sudo usermod -a -G home mealie

# Make directories
sudo mkdir -pv config/{homeassistant,esphome,mealie,mealie-db}-config

# Set permissions
sudo chown -R homeassistant:home config/homeassistant-config
sudo chown -R mealie:home config/mealie-config
sudo chown -R mealie:home config/mealie-db-config

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env

echo "Mealie DB Username:"
read -r MEALIEUN
echo "Mealie DB Password:"
read -rs MEALIEPW

echo "MEALIEDBUN=$MEALIEUN" >> .env
echo "MEALIEDBPW=$MEALIEPW" >> .env
