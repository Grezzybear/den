# DEN
A list of docker compose files for my home server.
---
References/Reading
- [EZARR](https://github.com/Luctia/ezarr/tree/main)
- [Servarr Wiki](https://wiki.servarr.com/docker-guide)
- [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy)
- [TRaSH's Guides For Hardlinks](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/)
---

This started as me just exploring docker compose and organizing my media so I started writing all these somewhat manually.
Eventually once i had something kinda working I ended up finding [EZARR](https://github.com/Luctia/ezarr/tree/main) which was basically everything I wanted to put together and more. I started adapting what I had already with the guidance of this other repository, largely with the setup.sh to initialize users, folder structure, and permissions. Many of these structural choices come from the [Servarr Wiki](https://wiki.servarr.com/docker-guide) which has great suggestions on how to set things up. The guide on hardlinks from [TRaSH](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/) also helped greatly.

Another great repo that helped me along was [Cloud-Reverse-Proxy](https://github.com/N-Quan/Cloud-Reverse-Proxy) from [N-Quan](https://github.com/N-Quan). I was having many issues finding out the correct iptables rules for forwarding traffic from a cloud VPS through wireguard, so this knowledge was invaluable. 

### User and Group Ids
Individual users/groups are set up for different services
Media-Server has users/groups that are 10000 based
Anything that deals with network traffic like traffic-control and pihole are 11000 based
Dashboard user/groups are 12000 based


## Media-Server
| App | Use | Notes |
| --- | --- | --- |
| Gluetun | VPN network connection | |
| QBitTorrent| Torrenting | The best [WebUI replacement](https://github.com/VueTorrent/VueTorrent?tab=readme-ov-file) I have found |
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
| Wireguard | VPS tunnel connection | |
| WNginxProxyManager | Reverse Proxy and SSL | |
