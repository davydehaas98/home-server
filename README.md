# home-server
My home server configuration using compose files.

## media-stack
| Name | Description |
| --- | --- |
| Bazarr | Subtitles manager for Sonarr and Radarr. |
| Jellyfin | Media stream service. |
| Lidarr | Music collection manager. |
| Plex | Media stream service. |
| Prowlarr | Proxy server for search queries. |
| Radarr | Movie collection manager. |
| Readarr | Book collection manager. |
| Sabnzbd | Binary news reader. |
| Sonarr | TV series collection manager. |
| Tautulli | Monitor server for Plex. |
| Transmission OpenVPN | Torrent client with VPN. |

## home-stack
| Name | Description |
| --- | --- |
| Grafana | Analytics and monitoring service. |
| Home Assistant | Home automation service. |
| Homebridge | Emulates the iOS HomeKit API. |
| Portainer | Web UI for Docker containers. Useful for managing all the containers on the server. |
| Prometheus | Systems monitoring and alertingtoolkit. |
| cadvisor | Container Advisor analyzes and exposes resource usage and performance data from running containers. |
| node-exporter | Exports hardware and kernel metrics. |
| alertmanager | Alert manager for Prometheus. |

# Environment Variables
```
UID=1400
GID=1400
TZ=Etc/UTC
USER_DIR=/home/homelab/home-server
DOMAIN_NAME=davydehaas.nl
```
