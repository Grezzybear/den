#!/bin/bash

# Make users and group
sudo useradd homeassistant -u 15001
sudo useradd esphome -u 15002
sudo useradd mealie -u 15004
sudo groupadd home -g 15000
sudo usermod -a -G home homeassistant
sudo usermod -a -G home mealie

# Make directories
sudo mkdir -pv assistant/config/{homeassistant,esphome}-config
sudo mkdir -pv mealie/config/{mealie,mealie-db}

# Set permissions
sudo chown -R homeassistant:home assistant/config/homeassistant-config
sudo chown -R mealie:home mealie/config/mealie
sudo chown -R mealie:home mealie/config/mealie-db

# set our base env values
echo "BASE=$(pwd)" >> assistant/.env
echo "TZ=Etc/UTC" >> assistant/.env
echo "BASE=$(pwd)" >> mealie/.env
echo "TZ=Etc/UTC" >> mealie/.env

echo "Mealie Base Url:"
read -r MEALIEURL
echo "Mealie DB Username:"
read -r MEALIEUN
echo "Mealie DB Password:"
read -rs MEALIEPW

echo "BASE_URL=$MEALIEURL" >> mealie/.env
echo "MEALIEDBUN=$MEALIEUN" >> mealie/.env
echo "MEALIEDBPW=$MEALIEPW" >> mealie/.env
