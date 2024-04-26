#!/bin/bash

# Make users and group
sudo useradd proton -u 13001
sudo useradd qbittorrent -u 13002
sudo useradd jellyfin -u 13003
sudo useradd audiobookshelf -u 13004
sudo useradd jellyseer -u 13005
sudo useradd prowlarr -u 13006
sudo useradd flaresolverr -u 13007
sudo useradd sonarr -u 13008
sudo useradd radarr -u 13009
sudo useradd readarr -u 13010
sudo useradd lidarr -u 13011
sudo useradd bazarr -u 13012
sudo useradd lazylibrarian -u 13013
sudo useradd freshrss -u 13014
sudo groupadd mediacenter -g 13000
sudo usermod -a -G mediacenter proton
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter jellyfin
sudo usermod -a -G mediacenter audiobookshelf
sudo usermod -a -G mediacenter jellyseer
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter flaresolverr
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter readarr
sudo usermod -a -G mediacenter lidarr
sudo usermod -a -G mediacenter bazarr
sudo usermod -a -G mediacenter lazylibrarian
sudo usermod -a -G mediacenter freshrss

# Make directories
sudo mkdir -pv config/{proton,qbittorrent,jellyfin,audiobookshelf,jellyseerr,prowlarr,flaresolverr,sonarr,radarr,readarr,lidarr,bazarr,lazylibrarian,freshrss}-config
sudo mkdir -pv data/{torrents,usenet,media}/{tv,movies,music,books,comics,audiobooks,podcasts,audiobookshelf-metadata}

# Set permissions
sudo chmod -R 775 data/
sudo chown -R $(id -u):mediacenter data/
sudo chown -R proton:mediacenter config/proton-config
sudo chown -R qbittorrent:mediacenter config/qbittorrent-config
sudo chown -R jellyfin:mediacenter config/jellyfin-config
sudo chown -R audiobookshelf:mediacenter config/audiobookshelf-config
sudo chown -R jellyseer:mediacenter config/jellyseer-config
sudo chown -R prowlarr:mediacenter config/prowlarr-config
sudo chown -R flaresolverr:mediacenter config/flaresolverr-config
sudo chown -R sonarr:mediacenter config/sonarr-config
sudo chown -R radarr:mediacenter config/radarr-config
sudo chown -R readarr:mediacenter config/readarr-config
sudo chown -R lidarr:mediacenter config/lidarr-config
sudo chown -R bazarr:mediacenter config/bazarr-config
sudo chown -R lazylibrarian:mediacenter config/lazylibrarian-config
sudo chown -R freshrss:mediacenter config/freshrss-config

# set our base env values
echo "UID=$(id -u)" >> .env
echo "BASE=$(pwd)" >> .env
"PROTON-UID=13001" >> .env
"QBIT-UID=13002" >> .env
"JELLYFIN-UID=13003" >> .env
"AUDIOBOOK-UID=13004" >> .env
"SEER-UID=13005" >> .env
"PROWLARR-UID=13006" >> .env
"FLARESOLVERR-UID=13007" >> .env
"SONARR-UID=13008" >> .env
"RADARR-UID=13009" >> .env
"READARR-UID=13010" >> .env
"LIDARR-UID=13011" >> .env
"BAZARR-UID=13012" >> .env
"LAZYLIBRARIAN-UID=13013" >> .env
"FRESHRSS-UID=13014" >> .env
"MEDIA-GID=13000" >> .env
"TZ=Etc/UTC" >> .env
