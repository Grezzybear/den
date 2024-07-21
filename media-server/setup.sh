#!/bin/bash

# Make users and group
sudo useradd proton -u 10001
sudo useradd qbittorrent -u 10002
sudo useradd jellyfin -u 10003
sudo useradd audiobookshelf -u 10004
sudo useradd jellyseerr -u 10005
sudo useradd prowlarr -u 10006
sudo useradd flaresolverr -u 10007
sudo useradd sonarr -u 10008
sudo useradd radarr -u 10009
sudo useradd readarr -u 10010
sudo useradd lidarr -u 10011
sudo useradd bazarr -u 10012
sudo useradd lazylibrarian -u 10013
sudo useradd freshrss -u 10014
sudo useradd navidrome -u 10015
sudo groupadd mediacenter -g 10000
sudo usermod -a -G mediacenter proton
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter jellyfin
sudo usermod -a -G mediacenter audiobookshelf
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
sudo usermod -a -G mediacenter navidrome

# Make directories
sudo mkdir -pv config/{proton,qbittorrent,jellyfin,audiobookshelf,jellyseerr,prowlarr,flaresolverr,sonarr,radarr,readarr,lidarr,bazarr,lazylibrarian,freshrss,navidrome}-config

# Set permissions
sudo chown -R proton:mediacenter config/proton-config
sudo chown -R qbittorrent:mediacenter config/qbittorrent-config
sudo chown -R jellyfin:mediacenter config/jellyfin-config
sudo chown -R audiobookshelf:mediacenter config/audiobookshelf-config
sudo chown -R jellyseerr:mediacenter config/jellyseerr-config
sudo chown -R prowlarr:mediacenter config/prowlarr-config
sudo chown -R flaresolverr:mediacenter config/flaresolverr-config
sudo chown -R sonarr:mediacenter config/sonarr-config
sudo chown -R radarr:mediacenter config/radarr-config
sudo chown -R readarr:mediacenter config/readarr-config
sudo chown -R lidarr:mediacenter config/lidarr-config
sudo chown -R bazarr:mediacenter config/bazarr-config
sudo chown -R lazylibrarian:mediacenter config/lazylibrarian-config
sudo chown -R freshrss:mediacenter config/freshrss-config
sudo chown -R navidrome:mediacenter config/navidrome-config

# set our base env values
#echo "UID=$(id -u)" >> .env
echo "BASE=$(pwd)" >> .env
#echo "PROTON-UID=10001" >> .env
#echo "QBIT-UID=10002" >> .env
#echo "JELLYFIN-UID=10003" >> .env
#echo "AUDIOBOOK-UID=10004" >> .env
#echo "SEER-UID=10005" >> .env
#echo "PROWLARR-UID=10006" >> .env
#echo "FLARESOLVERR-UID=10007" >> .env
#echo "SONARR-UID=10008" >> .env
#echo "RADARR-UID=10009" >> .env
#echo "READARR-UID=10010" >> .env
#echo "LIDARR-UID=10011" >> .env
#echo "BAZARR-UID=10012" >> .env
#echo "LAZYLIBRARIAN-UID=10013" >> .env
#echo "FRESHRSS-UID=10014" >> .env
#echo "NAVIDROME-UID=10015" >> .env
#echo "MEDIA-GID=10000" >> .env
echo "TZ=Etc/UTC" >> .env

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
# MediaTorrents
docker volume create --driver local \
    --label MediaTorrents \
    --opt type=nfs \
    --opt o=addr=$SERVERADDR,rw,noatime,rsize=8192,wsize=8192,tcp,timeo=14,nfsvers=4 \
    --opt device=:$MEDIABASEPATH/torrents \
    MediaTorrents
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
echo "# these are the wireguard/gluetun variables to connect to protonvpn" >> .env.secret
echo "VPN_ENDPOINT_IP=" >> .env.secret
echo "WIREGUARD_PUBLIC_KEY=" >> .env.secret
echo "WIREGUARD_PRIVATE_KEY=" >> .env.secret
