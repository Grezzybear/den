# DEN
A list of docker compose files for my home server.
---
References/Reading
- [EZARR](https://github.com/Luctia/ezarr/tree/main)
- [Servarr Wiki](https://wiki.servarr.com/docker-guide)
- [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy)
- [TRaSH's Guides For Hardlinks](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/) (really all of TRaSH Guides are invaluable)
---

This started as me just exploring docker compose and organizing my media so I started writing all these somewhat manually.
Eventually once i had something kinda working I ended up finding [EZARR](https://github.com/Luctia/ezarr/tree/main) which was basically everything I wanted to put together and more. I started adapting what I had already with the guidance of this other repository, largely with the setup.sh to initialize users, folder structure, and permissions. Many of these structural choices come from the [Servarr Wiki](https://wiki.servarr.com/docker-guide) which has great suggestions on how to set things up. The guide on hardlinks from [TRaSH](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/) also helped greatly.

Another great repo that helped me along was [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy) from [N-Quan](https://github.com/N-Quan). I was having many issues finding out the correct iptables rules for forwarding traffic from a cloud VPS through wireguard, so this knowledge was invaluable. 

### User and Group Ids
Individual users/groups are set up for different services

10000 - Media-Server things

11000 - Anything that deals with network traffic like traffic-control

12000 - Dashboard user/groups

13000 - Personal wikis

14000 - All production based containers

15000 - Smart home

16000 - Data collection/visualization

## Media-Server
| App | Image | Use | Notes |
| --- | --- | --- | --- |
| Gluetun | [qmcgaw/gluetun](https://hub.docker.com/r/qmcgaw/gluetun) | VPN network connection | Im using ProtonVPN for my VPN |
| Speedtest-Tracker | [lscr.io/linuxserver/speedtest-tracker](https://docs.linuxserver.io/images/docker-speedtest-tracker/) | Checks upload and download speeds through the VPN connection | Good to keep an eye on upload and download speeds through the VPN connection |
| QBitTorrent-NatMap | [ghcr.io/soxfor/qbittorrent-natmap](https://github.com/soxfor/qbittorrent-natmap) | Gets a forwarded port through the VPN for QBitTorrent to use and automatically sets it | A lovely little app that makes port forwarding much easier with QBitTorrent |
| QBitTorrent | [lscr.io/linuxserver/qbittorrent](https://docs.linuxserver.io/images/docker-qbittorrent/) | Torrenting | You can find web ui replacements [here](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-alternate-WebUIs) |
| Jellyfin | [lscr.io/linuxserver/jellyfin](https://docs.linuxserver.io/images/docker-jellyfin/) | Media viewing | |
| Audiobookshelf | [ghcr.io/advplyr/audiobookshelf](https://hub.docker.com/r/advplyr/audiobookshelf) | Audiobook streaming | |
| Jellyseerr | [fallenbagel/jellyseerr](https://hub.docker.com/r/fallenbagel/jellyseerr) | Media request service | |
| Prowlarr | [lscr.io/linuxserver/prowlarr](https://docs.linuxserver.io/images/docker-prowlarr/) | Index management | |
| Flaresolverr | [ghcr.io/flaresolverr/flaresolverr](https://hub.docker.com/r/flaresolverr/flaresolverr) | Security bypass | |
| Sonarr | [lscr.io/linuxserver/sonarr](https://docs.linuxserver.io/images/docker-sonarr/) | TV Downloads | |
| Radarr | [lscr.io/linuxserver/radarr](https://docs.linuxserver.io/images/docker-radarr) | Movie Downloads | |
| Readarr | [lscr.io/linuxserver/readarr](https://docs.linuxserver.io/images/docker-readarr) | Book Downloads | |
| Lidarr | [lscr.io/linuxserver/lidarr](https://docs.linuxserver.io/images/docker-lidarr) | Music Downloads | |
| Bazarr | [lscr.io/linuxserver/bazarr](https://docs.linuxserver.io/images/docker-bazarr) | Subtitle Downloads | |
| LazyLibrarian | [lscr.io/linuxserver/lazylibrarian](https://docs.linuxserver.io/images/docker-lazylibrarian) | Book metadata lookup | |
| FreshRSS | [lscr.io/linuxserver/freshrss](https://docs.linuxserver.io/images/docker-freshrss) | RSS Feed organizer | |
| Navidrome | [deluan/navidrome](https://hub.docker.com/r/deluan/navidrome) | Music Streaming App | |

## Traffic-Control
| App | Image | Use | Notes |
| --- | --- | --- | --- |
| Wireguard | [lscr.io/linuxserver/wireguard](https://docs.linuxserver.io/images/docker-wireguard) | VPS tunnel connection | Refer to [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy) from [N-Quan](https://github.com/N-Quan) to properly enable the VPS to forward all traffic through wireguard |
| NginxProxyManager | [jc21/nginx-proxy-manager](https://hub.docker.com/r/jc21/nginx-proxy-manager) | Reverse Proxy and SSL | Set up all your nice little public facing domain names. This is where SSL is easily set up with Let's Encrypt. SSL is terminated here. |

## Wiki
| App | Image | Use | Notes |
| --- | --- | --- | --- |
| Dokuwiki | [lscr.io/linuxserver/dokuwiki](https://docs.linuxserver.io/images/docker-dokuwiki/) | Digital notebook |  Base Config for a Dokuwiki container, can easily be duplicated |

## Production
| App | Image | Use | Notes |
| --- | --- | --- | --- |
| Nextcloud | [lscr.io/linuxserver/nextcloud](https://docs.linuxserver.io/images/docker-nextcloud) | File and office apps | |
| Taiga | --- | Project/Task management | Clone the full repo [here](https://github.com/taigaio/taiga-docker/tree/main) and run the setup.sh and copy in the docker-compose from this repo |

## Smart Home
| App | Image | Use | Notes |
| --- | --- | --- | --- |
| Home Assistant | [lscr.io/linuxserver/homeassistant](https://docs.linuxserver.io/images/docker-homeassistant) | Home Automation | Need to allow port 8123 on the server and run in host mode so it can detect devices on the network |
| ESPHOME | [ghcr.io/esphome/esphome](https://hub.docker.com/r/esphome/esphome) | ESP Device management | Need to allow port 6052 on the server and run in host mode so it can detect devices on the network. Through this app we are able to flash esphome devices, but only when running through https. |

## Watcher
| App | Image | Use | Notes |
| --- | --- | --- | --- |
| Dozzle | [amir20/dozzle](https://github.com/amir20/dozzle) | Easy way to view container logs from a web browser | |
| Watchtower | [containrrr/watchtower](https://containrrr.dev/watchtower/) | Easily update the running version of containers | |
| Prometheus | [prom/prometheus](https://hub.docker.com/r/prom/prometheus) | Data collection | If a container on this page can export data, I track that data |
| Grafana | [grafana/grafana](https://hub.docker.com/r/grafana/grafana) | Data visualization | Visualizes all my data and organizes all my dashboards so I can get see metrics at a glance |
| Uptime-Kuma | [louislam/uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma) | Tracks uptime for my apps, local and web | |
| Adguardhome | [adguard/adguardhome](https://hub.docker.com/r/adguard/adguardhome) | Free and open source, powerful network-wide ads & trackers blocking DNS server | Very useful for directing domain names to local addresses so you dont have to continually type ip addresses and ports |
| Speedtest-Tracker | [lscr.io/linuxserver/speedtest-tracker](https://docs.linuxserver.io/images/docker-speedtest-tracker/) | Checks upload and download speeds from your network | Useful information to keep track of to make sure you are getting the service you are paying for and track if there are any issues with your speeds |
