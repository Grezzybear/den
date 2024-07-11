#!/bin/bash

# Make users and group
sudo useradd dozzle -u 16001
sudo useradd watchtower -u 16002
sudo useradd prometheus -u 16003
sudo useradd grafana -u 16004
sudo useradd uptime-kuma -u 16005
sudo groupadd watcher -g 16000
sudo usermod -a -G watcher dozzle
sudo usermod -a -G watcher watchtower
sudo usermod -a -G watcher prometheus
sudo usermod -a -G watcher grafana
sudo usermod -a -G watcher uptimeKuma

# Make directories
sudo mkdir -pv {prometheus,grafana,uptime-kuma}/{data}
sudo mkdir -pv prometheus/config

# Set permissions
sudo chown -R prometheus:watcher prometheus
sudo chown -R grafana:watcher grafana
sudo chown -R uptime-kuma:watcher uptime-kuma

# set our base env values
echo "BASE=$(pwd)" >> .env
echo "TZ=Etc/UTC" >> .env
