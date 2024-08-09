#!/bin/bash

# Make users and group
sudo useradd dozzle -u 16001
sudo useradd watchtower -u 16002
sudo useradd prometheus -u 16003
sudo useradd grafana -u 16004
sudo useradd uptime-kuma -u 16005
sudo useradd adguardhome -u 16006
sudo useradd homeSpeedTest -u 16007
sudo groupadd watcher -g 16000
sudo usermod -a -G watcher dozzle
sudo usermod -a -G watcher watchtower
sudo usermod -a -G docker watchtower
sudo usermod -a -G watcher prometheus
sudo usermod -a -G watcher grafana
sudo usermod -a -G watcher uptime-kuma
sudo usermod -a -G watcher adguardhome
sudo usermod -a -G watcher homeSpeedTest

# Make directories
sudo mkdir -pv {prometheus,grafana,uptime-kuma,dozzle,adguardhome}/{data}
sudo mkdir -pv prometheus/config
sudo mkdir -pv adguardhome/config
sudo mkdir -pv speedtest-tracker/config

# Set permissions
sudo chown -R prometheus:watcher prometheus
sudo chown -R grafana:watcher grafana
sudo chown -R uptime-kuma:watcher uptime-kuma
sudo chown -R dozzle:watcher dozzle
sudo chown -R adguardhome:watcher adguardhome
sudo chown -R homeSpeedTest:watcher speedtest-tracker

# set our base env values
echo "speedtest-tracker app key (generate a key here: https://speedtest-tracker.dev):"
read -r SPEEDTESTKEY

echo "SPEEDTESTKEY=$SPEEDTESTKEY" >> .env

echo "Dozzle Username:"
read -r DOZZLEUSER
echo "Dozzle users real name:"
read -r DOZZLENAME
echo "Dozzle email:"
read -r DOZZLEEMAIL
echo "Dozzle Password:"
read -rs DOZZLEPASS

docker run amir20/dozzle generate $DOZZLEUSER --password $DOZZLEPASS --email $DOZZLEEMAIL --name "$NAME" > ./dozzle/data/users.yml

echo "$NEXTCLOUD_USER" >> secrets/nextcloud_admin_user.txt
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
