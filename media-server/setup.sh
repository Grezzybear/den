#!/bin/bash

# Make users and group
sudo groupadd mediacenter -g 10000

# arrs
sudo useradd proton -u 10101
sudo useradd protonSpeedTest -u 10102
sudo useradd qbittorrentNatMap -u 10103
sudo useradd qbittorrent -u 10104
sudo useradd jellystatdb -u 10105
sudo useradd jellystat -u 10106
sudo useradd jellyseerr -u 10107
sudo useradd prowlarr -u 10108
sudo useradd flaresolverr -u 10109
sudo useradd sonarr -u 10110
sudo useradd radarr -u 10111
sudo useradd readarr -u 10112
sudo useradd lidarr -u 10113
sudo useradd bazarr -u 10114
sudo useradd lazylibrarian -u 10115
sudo useradd freshrss -u 10116

sudo usermod -a -G mediacenter proton
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter jellyseerr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter flaresolverr
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter readarr
sudo usermod -a -G mediacenter lidarr
sudo usermod -a -G mediacenter bazarr
sudo usermod -a -G mediacenter lazylibrarian
sudo usermod -a -G mediacenter freshrss
sudo usermod -a -G mediacenter protonSpeedTest
sudo usermod -a -G mediacenter jellystat
sudo usermod -a -G mediacenter jellystatdb
# Make directories
sudo mkdir -pv arrs/config/{proton,qbittorrent,jellyseerr,prowlarr,flaresolverr,sonarr,radarr,readarr,lidarr,bazarr,lazylibrarian,freshrss,speedtesttracker,jellystat-db,jellystat}
# Set permissions
sudo chown -R proton:mediacenter arrs/config/proton
sudo chown -R qbittorrent:mediacenter arrs/config/qbittorrent
sudo chown -R jellyseerr:mediacenter arrs/config/jellyseerr
sudo chown -R prowlarr:mediacenter arrs/config/prowlarr
sudo chown -R flaresolverr:mediacenter arrs/config/flaresolverr
sudo chown -R sonarr:mediacenter arrs/config/sonarr
sudo chown -R radarr:mediacenter arrs/config/radarr
sudo chown -R readarr:mediacenter arrs/config/readarr
sudo chown -R lidarr:mediacenter arrs/config/lidarr
sudo chown -R bazarr:mediacenter arrs/config/bazarr
sudo chown -R lazylibrarian:mediacenter arrs/config/lazylibrarian
sudo chown -R freshrss:mediacenter arrs/config/freshrss
sudo chown -R protonSpeedTest:mediacenter arrs/config/speedtesttracker
sudo chown -R jellystatdb:mediacenter arrs/config/jellystat-db
sudo chown -R jellystat:mediacenter arrs/config/jellystat

# media-apps
sudo useradd jellyfin -u 10001
sudo useradd audiobookshelf -u 10002
sudo useradd navidrome -u 10003
sudo usermod -a -G mediacenter jellyfin
sudo usermod -a -G mediacenter audiobookshelf
sudo usermod -a -G mediacenter navidrome
# Make directories
sudo mkdir -pv media-apps/config/{jellyfin,audiobookshelf,navidrome}
# Set permissions
sudo chown -R jellyfin:mediacenter media-apps/config/jellyfin
sudo chown -R audiobookshelf:mediacenter media-apps/config/audiobookshelf
sudo chown -R navidrome:mediacenter media-apps/config/navidrome


# set our base env values
echo "BASE=$(pwd)" >> arrs/.env
echo "BASE=$(pwd)" >> media-apps/.env
echo "TZ=Etc/UTC" >> arrs/.env
echo "TZ=Etc/UTC" >> media-apps/.env

echo "Jellystat DB Username:"
read -r JELLYSTATUN
echo "Jellystat DB Password:"
read -rs JELLYSTATPW
echo "Jellystat Secret (generate a random key yourself):"
read -rs JWT_SECRET

echo "JELLYSTATUN=$JELLYSTATUN" >> arrs/.env
echo "JELLYSTATPW=$JELLYSTATPW" >> arrs/.env
echo "JWT_SECRET=$JWT_SECRET" >> arrs/.env

echo "Qbittorrent Username (you have to use this password when you set up qbittorrent for the first time):"
read -r QBITUN
echo "Qbittorrent Password (you have to use this password when you set up qbittorrent for the first time):"
read -rs QBITPW

echo "QBITUN=$QBITUN" >> arrs/.env
echo "QBITPW=$QBITPW" >> arrs/.env

echo "speedtest-tracker app key (generate a key here: https://speedtest-tracker.dev):"
read -r SPEEDTESTKEY

echo "SPEEDTESTKEY=$SPEEDTESTKEY" >> arrs/.env

echo "NAS Address:"
read -r SERVERADDR
#echo "SERVERADDR=$SERVERADDR" >> .env

echo "NAS base path to media folder:" # this is the path to the root folder, in unraid it would be the path to your share like /mnt/user/media-storage
read -r MEDIABASEPATH
#echo "MEDIABASEPATH=$MEDIABASEPATH" >> .env

echo "Creating volumes..."
# MediaStorage
docker volume create --driver local \
    --label MediaStorage \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH \
    MediaStorage
# MediaLibrary
docker volume create --driver local \
    --label MediaLibrary \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH/media \
    MediaLibrary
# MediaAudiobooks
docker volume create --driver local \
    --label MediaAudiobooks \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH/media/audiobooks \
    MediaAudiobooks
# MediaAudiobooksMetadata
docker volume create --driver local \
    --label MediaAudiobooksMetadata \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH/media/audiobookshelf-metadata \
    MediaAudiobooksMetadata
# MediaPodcasts
docker volume create --driver local \
    --label MediaPodcasts \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH/media/podcasts \
    MediaPodcasts
# MediaMusic
docker volume create --driver local \
    --label MediaMusic \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH/media/music \
    MediaMusic

# setup our secret env file
echo "# these are the wireguard/gluetun variables to connect to protonvpn" >> arrs/.env.secret
echo "VPN_ENDPOINT_IP=" >> arrs/.env.secret
echo "WIREGUARD_PUBLIC_KEY=" >> arrs/.env.secret
echo "WIREGUARD_PRIVATE_KEY=" >> arrs/.env.secret
echo "Make sure to set your Public and Private Keys in arrs/.env.secret"
