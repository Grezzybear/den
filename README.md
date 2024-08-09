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
| App | Use | Notes |
| --- | --- | --- |
| Gluetun | VPN network connection | Im using ProtonVPN for my VPN |
| Speedtest-Tracker | Checks upload and download speeds through the VPN connection | Good to keep an eye on upload and download speeds through the VPN connection |
| QBitToorent-NatMap | Gets a forwarded port through the VPN for QBitTorrent to use and automatically sets it | A lovely little app that makes port forwarding much easier with QBitTorrent |
| QBitTorrent| Torrenting | You can find web ui replacements [here](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-alternate-WebUIs) |
| Jellyfin | Media viewing | |
| Audiobookshelf | Audiobook streaming | |
| Jellyseerr | Media request service | |
| Prowlarr | Index management | |
| Flaresolverr | Security bypass | |
| Sonarr | TV Downloads | |
| Radarr | Movie Downloads | |
| Readarr | Book Downloads | |
| Lidarr | Music Downloads | |
| Bazarr | Subtitle Downloads | |
| LazyLibrarian | Book metadata lookup | |
| FreshRSS | RSS Feed organizer | |
| Navidrome | Music Streaming App | |

## Traffic-Control
| App | Use | Notes |
| --- | --- | --- |
| Wireguard | VPS tunnel connection | Refer to [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy) from [N-Quan](https://github.com/N-Quan) to properly enable the VPS to forward all traffic through wireguard |
| NginxProxyManager | Reverse Proxy and SSL | Set up all your nice little public facing domain names. This is where SSL is easily set up with Let's Encrypt. SSL is terminated here. |

## Wiki
| App | Use | Notes |
| --- | --- | --- |
| Wiki.js | Digital notebook |  Base Config for a Wiki.js container, can easily be duplicated |

## Production
| App | Use | Notes |
| --- | --- | --- |
| Nextcloud | File and office apps | |
| Taiga | Project/Task management | Clone the full repo [here](https://github.com/taigaio/taiga-docker/tree/main) and run the setup.sh and copy in the docker-compose from this repo |

## Smart Home
| App | Use | Notes |
| --- | --- | --- |
| Home Assistant | Home Automation | Need to allow port 8123 on the server and run in host mode so it can detect devices on the network |
| ESPHOME | ESP Device management | Need to allow port 6052 on the server and run in host mode so it can detect devices on the network. Through this app we are able to flash esphome devices, but only when running through https. |

## Watcher
| App | Use | Notes |
| --- | --- | --- |
| Dozzle | Easy way to view container logs from a web browser | |
| Watchtower | Easily update the running version of containers | |
| Prometheus | Data collection | If a container on this page can export data, I track that data |
| Grafana | Data visualization | Visualizes all my data and organizes all my dashboards so I can get see metrics at a glance |
| Uptime-Kuma | Tracks uptime for my apps, local and web | |
| Adguardhome | Free and open source, powerful network-wide ads & trackers blocking DNS server | Very useful for directing domain names to local addresses so you dont have to continually type ip addresses and ports |
| Speedtest-Tracker | Checks upload and download speeds from your network | Useful information to keep track of to make sure you are getting the service you are paying for and track if there are any issues with your speeds |
