# home-server
My home server configuration set up using compose files.

## Hardware setup
| Component | Name |
| --- | --- |
| CPU | Intel i5 10600K (6 cores, AMD64) |
| CPU Cooler | be quiet! Dark Rock Slim |
| RAM | 2x 16GB DDR4 @ 3.200MT/s |
| Motherboard | ASRock Z490M-ITX/ac |
| Storage | Samsung 970 Evo Plus 500 GB SSD |
| Storage | 3x Seagate IronWolf 4TB HDD |
| PSU | Corsair RM750x |
| Case | Fractal Design Node 304 Black |
| OS | Ubuntu Server 24.10 |

# Stacks

## home-stack
| Name | Description |
| --- | --- |
| cAdvisor | Analyzes and exposes resource usage and performance data from running containers. |
| Grafana | Analytics and monitoring service. |
| Home Assistant | Home automation service. |
| Homebridge | Emulates the iOS HomeKit API. |
| Portainer | Web UI for Docker containers. Useful for managing all the containers on the server. |
| Prometheus | Systems monitoring and alertingtoolkit. |
| Prometheus Alertmanager | Alert manager for Prometheus. |
| Prometheus Node exporter | Exports hardware and OS metrics. |

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

## reverse-proxy-stack
| Name | Description |
| --- | --- |
| Authelia | IAM SSO companion for reverse proxy. |
| Cloudflare Companion | CNAME DNS updater. |
| Cloudflare DDNS | Dynamic DNS updater. |
| Traefik | Reverse proxy for HTTP requests. |

# Environment Variables
```
UID=1400
GID=1400
TZ=Etc/UTC
USER_DIR=/home/homelab/home-server
DOMAIN_NAME=davydehaas.nl
```
