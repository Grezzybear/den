# DEN
A list of docker compose files for my home server.

This started as me just exploring docker compose and organizing my media so I started writing all these somewhat manually.
Eventually once i had something kinda working I ended up finding [EZARR](https://github.com/Luctia/ezarr/tree/main) which was basically everything I wanted to put together and more. I started adapting what I had already with the guidance of this other repository, largely with the setup.sh to initialize users, folder structure, and permissions. Many of these structural choices come from the [Servarr Wiki](https://wiki.servarr.com/docker-guide) which has great suggestions on how to set things up.
Another great repo that helped me along was [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy) from [N-Quan](https://github.com/N-Quan). I was having many issues finding out the correct iptables rules for forwarding traffic from a cloud VPS through wireguard, so this knowledge was invaluable. 

## Media-Server
- Gluetun
- Qbittorrent
- Jellyfin
- Audiobookshelf
- Jellyseer
- Prowlarr
- Flaresolverr
- Sonarr
- Radarr
- Readarr
- Lidarr
- Bazarr
- Lazylibrarian
- Freshrss
- Navidrome

## Traffic-Control
- Wireguard
- NginxProxyManager
