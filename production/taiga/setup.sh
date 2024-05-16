#!/bin/bash

# Make users and group
sudo useradd taiga-db -u 14003
sudo useradd taiga-back -u 14004
sudo useradd taiga-async -u 14005
sudo useradd taiga-async-rabbitmq -u 14006
sudo useradd taiga-front -u 14007
sudo useradd taiga-events -u 14008
sudo useradd taiga-events-rabbitmq -u 14009
sudo useradd taiga-protected -u 14010
sudo useradd taiga-gateway -u 14011
sudo groupadd taiga -g 14001
sudo usermod -a -G taiga taiga-db
sudo usermod -a -G taiga taiga-back
sudo usermod -a -G taiga taiga-async
sudo usermod -a -G taiga taiga-async-rabbitmq
sudo usermod -a -G taiga taiga-front
sudo usermod -a -G taiga taiga-events
sudo usermod -a -G taiga taiga-events-rabbitmq
sudo usermod -a -G taiga taiga-protected
sudo usermod -a -G taiga taiga-gateway

# Make directories
sudo mkdir -pv taiga-db-data
sudo mkdir -pv taiga-static-data
sudo mkdir -pv taiga-media-data
sudo mkdir -pv taiga-async-rabbitmq-data
sudo mkdir -pv taiga-events-rabbitmq-data
sudo mkdir -pv taiga-gateway

# Set permissions
sudo chown -R taiga-db:taiga taiga-db-data
sudo chown -R taiga-back:taiga taiga-static-data
sudo chown -R taiga-back:taiga taiga-media-data
sudo chown -R taiga-async-rabbitmq:taiga taiga-async-rabbitmq-data
sudo chown -R taiga-events-rabbitmq:taiga taiga-events-rabbitmq-data
sudo chown -R taiga-gateway:taiga taiga-gateway
