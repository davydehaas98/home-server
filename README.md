# home-server

My home server configuration set up using compose files.

## Hardware setup

| Component   | Name                             |
| ----------- | -------------------------------- |
| CPU         | Intel i5 10600K (6 cores, AMD64) |
| CPU Cooler  | be quiet! Dark Rock Slim         |
| RAM         | 2x 16GB DDR4 @ 3.200MT/s         |
| Motherboard | ASRock Z490M-ITX/ac              |
| Storage     | Samsung 970 Evo Plus 500 GB SSD  |
| Storage     | 3x Seagate IronWolf 4TB HDD      |
| PSU         | Corsair RM750x                   |
| Case        | Fractal Design Node 304 Black    |
| OS          | Ubuntu Server 24.10              |

# Stacks

## home-stack

| Name                     | Description                                                                         | Links                                                    |
| ------------------------ | ----------------------------------------------------------------------------------- | -------------------------------------------------------- |
| cAdvisor                 | Analyzes and exposes resource usage and performance data from running containers.   | [GitHub](https://github.com/google/cadvisor)             |
| Grafana                  | Analytics and monitoring service.                                                   | [GitHub](https://github.com/grafana/grafana)             |
| Home Assistant           | Home automation service.                                                            | [GitHub](https://github.com/home-assistant/core)         |
| Homebridge               | Emulates the iOS HomeKit API.                                                       | [GitHub](https://github.com/homebridge/homebridge)       |
| Mosquitto                | Message Queuing Telemetry Transport (MQTT) broker                                   | [GitHub](https://github.com/eclipse-mosquitto/mosquitto) |
| Portainer                | Web UI for Docker containers. Useful for managing all the containers on the server. | [GitHub](https://github.com/portainer/portainer)         |
| Prometheus               | Systems monitoring and alertingtoolkit.                                             | [GitHub](https://github.com/prometheus/prometheus)       |
| Prometheus Alertmanager  | Alert manager for Prometheus.                                                       | [GitHub](https://github.com/prometheus/alertmanager)     |
| Prometheus Node exporter | Exports hardware and OS metrics.                                                    | [GitHub](https://github.com/prometheus/node_exporter)    |

## media-stack

| Name                 | Description                                    | Links                                                            |
| -------------------- | ---------------------------------------------- | ---------------------------------------------------------------- |
| Bazarr               | Subtitles manager for Sonarr and Radarr.       | [GitHub](https://github.com/morpheus65535/bazarr)                |
| Gluetun              | VPN client.                                    | [GitHub](https://github.com/qdm12/gluetun)                       |
| Jellyfin             | Media stream service.                          | [GitHub](https://github.com/jellyfin/jellyfin)                   |
| Lidarr               | Music collection manager.                      | [GitHub](https://github.com/Lidarr/Lidarr)                       |
| Plex                 | Media stream service.                          | [GitHub](https://github.com/plexinc/pms-docker)                  |
| Prowlarr             | Proxy server for search queries.               | [GitHub](https://github.com/Prowlarr/Prowlarr)                   |
| qBittorrent          | Torrent client.                                | [GitHub](https://github.com/qbittorrent/qBittorrent/)            |
| Radarr               | Movie collection manager.                      | [GitHub](https://github.com/Radarr/Radarr)                       |
| Readarr              | Book collection manager.                       | [GitHub](https://github.com/Readarr/Readarr)                     |
| SABnzbd              | Binary news reader.                            | [GitHub](https://github.com/sabnzbd/sabnzbd)                     |
| Sonarr               | TV series collection manager.                  | [GitHub](https://github.com/Sonarr/Sonarr)                       |
| Tautulli             | Monitor server for Plex.                       | [GitHub](https://github.com/Tautulli/Tautulli)                   |
| Transmission OpenVPN | Torrent client with VPN client.                | [GitHub](https://github.com/haugene/docker-transmission-openvpn) |
| Threadfin            | xTeve M3U Proxy for Plex DVR and Emby Live TV. | [GitHub](https://github.com/Threadfin/Threadfin)                 |

## reverse-proxy-stack

| Name                 | Description                          | Links                                                                      |
| -------------------- | ------------------------------------ | -------------------------------------------------------------------------- |
| Authelia             | IAM SSO companion for reverse proxy. | [GitHub](https://github.com/authelia/authelia)                             |
| Cloudflare Companion | CNAME DNS updater.                   | [GitHub](https://github.com/tiredofit/docker-traefik-cloudflare-companion) |
| Cloudflare DDNS      | Dynamic DNS updater.                 | [GitHub](https://github.com/favonia/cloudflare-ddns)                       |
| Traefik              | Reverse proxy for HTTP requests.     | [GitHub](https://github.com/traefik/traefik)                               |

# Environment Variables

```
UID=1400
GID=1400
TZ=Etc/UTC
USER_DIR=/home/homelab/home-server
DOMAIN_NAME=davydehaas.nl
```
