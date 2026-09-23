# home-server

My home server configuration set up using compose files.

**Stacks**

[![Deploy home-stack](https://github.com/davydehaas98/home-server/actions/workflows/home-stack.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/home-stack.yaml)<br/>
[![Deploy media-stack](https://github.com/davydehaas98/home-server/actions/workflows/media-stack.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/media-stack.yaml)<br/>
[![Deploy reverse-proxy-stack](https://github.com/davydehaas98/home-server/actions/workflows/reverse-proxy-stack.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/reverse-proxy-stack.yaml)

**Terraform**

[![Terraform AWS](https://github.com/davydehaas98/home-server/actions/workflows/terraform-aws.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/terraform-aws.yaml)<br/>
[![Terraform Cloudflare davydehaas.dev](https://github.com/davydehaas98/home-server/actions/workflows/terraform-cloudflare-davydehaas-dev.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/terraform-cloudflare-davydehaas-dev.yaml)<br/>
[![Terraform Cloudflare davydehaas.nl](https://github.com/davydehaas98/home-server/actions/workflows/terraform-cloudflare-davydehaas-nl.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/terraform-cloudflare-davydehaas-nl.yaml)<br/>
[![Terraform OCI](https://github.com/davydehaas98/home-server/actions/workflows/terraform-oci.yaml/badge.svg)](https://github.com/davydehaas98/home-server/actions/workflows/terraform-oci.yaml)

## Hardware setup

| Component   | Name                                      |
|-------------|-------------------------------------------|
| CPU         | Intel i5 10600K (6 cores, AMD64)          |
| CPU Cooler  | be quiet! Dark Rock Slim                  |
| RAM         | 2x 16GB DDR4 @ 3.200MT/s                  |
| Motherboard | ASRock Z490M-ITX/ac                       |
| Storage     | 1x Samsung 970 Evo Plus 500 GB SSD        |
| Storage     | 3x Seagate IronWolf 4TB HDD               |
| Storage     | 1x Seagate Exos 16 TB HDD (ST16000NM002C) | 
| PSU         | Corsair RM750x                            |
| Case        | Fractal Design Node 304 Black             |
| OS          | Ubuntu Server 26.04                       |

## Stacks

### home-stack

| Name                     | Description                                                                         | Links                                                      |
|--------------------------|-------------------------------------------------------------------------------------|------------------------------------------------------------|
| Actual Budget            | Personal finance and budgeting app.                                                 | [GitHub](https://github.com/actualbudget/actual)           |
| AdGuard Home             | Network-wide ad and tracker blocking DNS server.                                    | [GitHub](https://github.com/AdguardTeam/AdGuardHome)       |
| Airtrail                 | Flight logging and travel statistics tracker.                                       | [GitHub](https://github.com/Kicksite/airtrail)             |
| BOINC                    | Volunteer distributed computing client.                                             | [GitHub](https://github.com/BOINC/boinc)                   |
| cAdvisor                 | Analyzes and exposes resource usage and performance data from running containers.   | [GitHub](https://github.com/google/cadvisor)               |
| code-server              | VS Code running in the browser.                                                     | [GitHub](https://github.com/coder/code-server)             |
| Dozzle                   | Real-time log viewer for Docker containers.                                         | [GitHub](https://github.com/amir20/dozzle)                 |
| Grafana                  | Analytics and monitoring service.                                                   | [GitHub](https://github.com/grafana/grafana)               |
| Home Assistant           | Home automation service.                                                            | [GitHub](https://github.com/home-assistant/core)           |
| Homebridge               | Emulates the iOS HomeKit API.                                                       | [GitHub](https://github.com/homebridge/homebridge)         |
| Homepage                 | Application dashboard and startpage.                                                | [GitHub](https://github.com/gethomepage/homepage)          |
| Immich                   | Self-hosted photo and video backup service.                                         | [GitHub](https://github.com/immich-app/immich)             |
| IT Tools                 | Collection of handy online tools for developers.                                    | [GitHub](https://github.com/CorentinTh/it-tools)           |
| Jaeger                   | Distributed tracing platform.                                                       | [GitHub](https://github.com/jaegertracing/jaeger)          |
| Memos                    | Self-hosted, lightweight note-taking service.                                       | [GitHub](https://github.com/usememos/memos)                |
| Mosquitto                | Message Queuing Telemetry Transport (MQTT) broker                                   | [GitHub](https://github.com/eclipse-mosquitto/mosquitto)   |
| Nextcloud                | Self-hosted file sync and collaboration platform.                                   | [GitHub](https://github.com/nextcloud/server)              |
| Ollama                   | Local runtime for running large language models.                                    | [GitHub](https://github.com/ollama/ollama)                 |
| Omni Tools               | Collection of handy online tools for developers.                                    | [GitHub](https://github.com/iib0011/omni-tools)            |
| Open WebUI               | Web UI for interacting with local and remote LLMs.                                  | [GitHub](https://github.com/open-webui/open-webui)         |
| Personal website         | Personal portfolio website.                                                         | [GitHub](https://github.com/davydehaas98/personal-website) |
| Portainer                | Web UI for Docker containers. Useful for managing all the containers on the server. | [GitHub](https://github.com/portainer/portainer)           |
| Prometheus               | Systems monitoring and alertingtoolkit.                                             | [GitHub](https://github.com/prometheus/prometheus)         |
| Prometheus Alertmanager  | Alert manager for Prometheus.                                                       | [GitHub](https://github.com/prometheus/alertmanager)       |
| Prometheus Node exporter | Exports hardware and OS metrics.                                                    | [GitHub](https://github.com/prometheus/node_exporter)      |
| Uptime Kuma              | Self-hosted uptime monitoring tool.                                                 | [GitHub](https://github.com/louislam/uptime-kuma)          |
| WireGuard Easy           | Web UI for managing a WireGuard VPN server.                                         | [GitHub](https://github.com/wg-easy/wg-easy)               |
| Zigbee2MQTT              | Zigbee to MQTT bridge.                                                              | [GitHub](https://github.com/Koenkk/zigbee2mqtt)            |

### media-stack

| Name                 | Description                                    | Links                                                            |
|----------------------|------------------------------------------------|------------------------------------------------------------------|
| Bazarr               | Subtitles manager for Sonarr and Radarr.       | [GitHub](https://github.com/morpheus65535/bazarr)                |
| Gluetun              | VPN client.                                    | [GitHub](https://github.com/qdm12/gluetun)                       |
| Jellyfin             | Media stream service.                          | [GitHub](https://github.com/jellyfin/jellyfin)                   |
| Lidarr               | Music collection manager.                      | [GitHub](https://github.com/Lidarr/Lidarr)                       |
| Plex                 | Media stream service.                          | [GitHub](https://github.com/plexinc/pms-docker)                  |
| Prowlarr             | Proxy server for search queries.               | [GitHub](https://github.com/Prowlarr/Prowlarr)                   |
| qBittorrent          | Torrent client.                                | [GitHub](https://github.com/qbittorrent/qBittorrent/)            |
| Radarr               | Movie collection manager.                      | [GitHub](https://github.com/Radarr/Radarr)                       |
| SABnzbd              | Binary news reader.                            | [GitHub](https://github.com/sabnzbd/sabnzbd)                     |
| Seerr                | Media request manager and discovery tool.      | [GitHub](https://github.com/seerr-team/seerr)                    |
| Sonarr               | TV series collection manager.                  | [GitHub](https://github.com/Sonarr/Sonarr)                       |
| Tautulli             | Monitor server for Plex.                       | [GitHub](https://github.com/Tautulli/Tautulli)                   |
| Transmission OpenVPN | Torrent client with VPN client.                | [GitHub](https://github.com/haugene/docker-transmission-openvpn) |
| Threadfin            | xTeve M3U Proxy for Plex DVR and Emby Live TV. | [GitHub](https://github.com/Threadfin/Threadfin)                 |
| Tracearr             | Activity dashboard for the media stack.        | [GitHub](https://github.com/connorgallopo/tracearr)              |

### reverse-proxy-stack

| Name                 | Description                          | Links                                                                      |
|----------------------|--------------------------------------|----------------------------------------------------------------------------|
| Authentik            | IAM SSO companion for reverse proxy. | [GitHub](https://github.com/goauthentik/authentik)                         |
| Cloudflare Companion | CNAME DNS updater.                   | [GitHub](https://github.com/tiredofit/docker-traefik-cloudflare-companion) |
| Cloudflare DDNS      | Dynamic DNS updater.                 | [GitHub](https://github.com/favonia/cloudflare-ddns)                       |
| Traefik              | Reverse proxy for HTTP requests.     | [GitHub](https://github.com/traefik/traefik)                               |

## Environment Variables

```shell
UID=1400
GID=1400
TZ=Etc/UTC
USER_DIR=/home/homelab/home-server
DOMAIN_NAME=davydehaas.nl
DOMAIN_NAME_DEV=davydehaas.dev
```
