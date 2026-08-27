# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`home-server` is a **Docker Compose monorepo** for self-hosting applications on an Ubuntu Linux server via remote SSH deployment using GitHub Actions CI workflows and Terraform infrastructure-as-code. It contains ~50 Docker service definitions across three stacks (monitoring, media management, reverse proxy) plus Terraform configs in `_terraform/`.

## Repository Structure

```
C:/Projects/home-server/
├── .github/workflows/              # GitHub Actions CI/deploy workflows: home-stack.yaml, media-stack.yaml, reverse-proxy-stack.yaml, terraform.yaml
│   ├── _deploy.sh                  # Common deployment script (rsync + docker compose up)
│   └── *.yaml                      # One workflow per stack folder
├── _terraform/                     # Terraform configs for cloud infra (AWS/GCP/Azure modules and providers)
├── diagrams/                       # Architecture documentation (.puml PlantUML files)
├── compose.template.yaml           # Base template with common service configurations used by all stacks
└── {home-stack|media-stack|reverse-proxy-stack}/    ← Stack folders contain services below
        ├── config/                 # Service-specific Docker volumes defined as local paths on server (~/...)
        └── disabled/               # Deprecated/disabled compose files for old versions

Stack Example: jellyfin stack in media-stack/
├── compose.jellyfin.yaml          # Main docker-compose file (~200 lines, defines services)
├── compose.config                 # Directory of service configs to rsync (not .env or state)
│   └── ...config files...         # Example: jellyfin/config/, authentik/configuration.yaml
└── disabled/                      # Old/disabled stack versions for historical reference
```

## Deployment Workflow (NO npm/node.js Build Steps)

This repo **does not use** package.json/npm/yarn/bun. All deployment is infrastructure-based via CI → rsync to remote server:

1. Push matching path to main branch triggers GitHub Action workflow in `.github/workflows/` folder
2. SSH into Ubuntu server, copies only `compose.*.yaml` files (excludes `/home-server/.env`, terraform state) using `_deploy.sh`:
```bash
rsync -avz --exclude '/media-stack/config' ... \     # rsync excludes .env and media config volumes by default to protect secrets on first deploy
    ~/.local/home/homeserver/docker/media/stacks/jellyfin/*.yaml ./jellyfish/.docker-compose-media-*.yml:
```
3. Remote server runs `docker compose up -d --remove-orphans` for all matched services in stack folder

Each service container mounts host paths like `~/home-server/<app>/config:/container/config:rw`, pointing to local volumes on SSD/NAS storage at `/mnt/raid`.

## Docker Compose Template (`compose.template.yaml`)

Common patterns shared across ALL compose files (indent_size 2):
- Service resource limits/reservations defined with CPU/memory values in RAM format
- Traefik labels for service discovery and Authentik auth via `traefik.http.routers.<name>.middlewares: chain-authentik@file` label
- Healthcheck tests with intervals/timeouts/retries using CMD/CURL syntax like docker exec to curl ping
- All services use `${UID}:${GID}` in user field and set cap_add for required capabilities (NET_ADMIN etc.)

Template snippet example:
```yaml
services:
  busybox:
    image: docker.io/library/busybox:1.38.0
    container_name: busybox
    user: ${UID}:${GID}                              # Reference env vars resolved by compose plugin at runtime on server deploy (not .env)
    ports:                                           # Exposed externally via Traefik router rules, not direct docker host port binding
      - "80:80/tcp"                                  # These are internal container service ports for label discovery only
      - "80:80/udp"                                 
```

### Environment Variable Usage

Env vars like `${PUID}:${PGUID}` and `${DOMAIN_NAME}` in compose files get resolved at CI runtime by the compose plugin from GitHub Actions secrets or repo `.env` references. No explicit env block needed for each service (plugin injects values). The template file defines defaults that services inherit unless overridden with custom config blocks per app version folder.

## Terraform Infrastructure-as-Code (`_terraform/`)

This project uses Terraform to provision cloud resources in AWS/GCP/Azure:
```bash
# Deploy infrastructure using CLI tool (tf command exists via docker-compose plugin or local bin)
cd _terraform; terraform apply -auto-approve  # Deploys VPC, subnets, EC2 instances for home-server
```

Provider definitions specify target cloud region/zone. State files tracked in `.github/workflows` deploy step run with `terraform fmt`, `validate`, and show state drift detection during CI runs on each push to main branch before merging commits against staging deployment pipelines only (never prod without manual review by owner).

## Shell Script Conventions (`create-user.sh`)

- POSIX sh for portability across Ubuntu servers
- Constants in uppercase: e.g., HOME_DIR, APP_USER_HOME
- Bash functions defined as reusable snippets with `local` scope to avoid pollution
- Shebang lines always specified at top (#!/bin/sh or #!/usr/bin/env bash)
- Exit codes set explicitly after each command group for pipeline safety

Example function pattern from shell scripts:
```bash
create_docker_user() {                              # Function names are lowercase with dashes/underscores per snake_case conventions in Docker world  
  local username="$1"                                # Param default to lower-case convention except environment variable references like ${PUID} which use PUID format defined by compose plugin at runtime during deployment from CI 
  mkdir -p "${APP_USER_HOME}/${username}"             # Use APP_USER_HOME constant path, not hardcoded home directory
```

## Service Configuration Organization Per App Stack

Each stack folder has:  
1. **`compose.*.yaml` files** — Primary docker-compose definitions (~50 services total), naming matches service name for discoverability (jellyfin.yaml defines jellyfin container)  
2. **`config/` subfolder** — Persistent volume data and secrets like `authentik/configuration.yaml`, Traefik rules, app-specific configs that mount as host volumes  
3. **`disabled/` folder** — Contains old versions of services when updates are released to keep git history clean (not deployed via CI)  

Example service file:
```yaml
services:
  jellyfin:
    image: docker.io/jellyfin/jellyfin:v10.9.6          # Docker tag version pinned, no npm package.json scripts 
    container_name: jellyfish-server                    # Container names are snake_case to avoid URL collision with other stacks' deployments  
    ports:                                               # Only internal service discovery (Traefik routes externally via router rules)
      - "${JELLYFIN_HTTP_PORT}:8091/tcp"                # Env var placeholder resolves on compose plugin runtime at deploy step
```

## File Conventions and Standards

### YAML Files (`indent_size = 2`)  
- Indent with exactly **2 spaces** (editor config enforces this)  
- No trailing whitespace, LF line endings for all servers' consistency in SSH session output logs  

### JSON/JavaScript/Web Files (`indent_size = 2` or default tab for Makefiles only)
- Use consistent indentation based on editorconfig patterns above

### Markdown Documentation (`indent_size = 4`)
- Include shell command blocks with language identifier: ```shell not bash to show POSIX compatibility requirements when applicable in scripts section below  
- Document service-specific commands like Mosquitto pubsub calls and PostgreSQL backup/restore procedures  

## Key Commands for Development Context

This is an infrastructure project without traditional code development flow. Primary "commands" involve managing Docker Compose stacks remotely:

### Local CLI Operations (On Remote Ubuntu Server via SSH)
```bash
# Navigate to stack folder, run docker compose up on target host machine  
cd ~/home-server/home-stack; docker compose -f compose.<service>.yaml up -d --remove-orphans  

# View service logs across all containers in current deploy context including auth services and monitoring dashboards like prometheus/grafana
docker compose <stack-name/logs 

# Restart a specific container (replace SERVICE with actual name from file)  
cd ~/home-server/<STACK>; docker restart ${SERVICE}   

# Execute command inside running jellyfin service container shell without breaking current stack state on reboot cycles during office hours or overnight maintenance windows only when required
docker exec -it <container-name> /bin/bash             # Replace <service> with actual name from compose.yaml file definition  
```  

### Deploy New Services via CI (Push to main branch)
- Add new `compose.*.yaml` files and related config folders in appropriate stack folder before commit push triggers workflow automatically on repo server's remote origin path pattern matching regex filters defined per `.github/workflows/` YAML pipeline stages for home/media/reverse-proxy stacks only

### Terraform Operations (On Cloud Console or Local Dev Machine)
```bash
cd _terraform; terraform init -backend=false            # Initialize without backend state persistence to avoid AWS credentials prompt during initial local dev setup  
terraform fmt                                          # Format all .tf files before committing changes for PR review checklist items in CI pipeline validation gates defined per `.github/workflows/` Terraform workflow definition file at repo root directory level
```

## Important Notes For Claude Instances Working Here:

1. **No build tools**: This is not an npm/yarn/bun project. Deployment uses Docker Compose + SSH rsync workflows with terraform fmt to check formatting and validate config files before pushing changes back to main branch commit after manual review by maintainer team owner only when required for critical patches affecting prod environment stability during business hours or emergency hotfix situations requiring immediate deployment without normal CI approval gates in place  
2. **No testing framework**: Healthchecks embedded within each compose service definition run automatically on container restart cycles via docker exec commands with curl ping tests to verify endpoint liveness and readiness probe endpoints defined per Kubernetes-style conventions for cloud-native application deployments across hybrid server environments including bare-metal VM instances running Ubuntu Server 26.04 LTS as base OS layer  
3. **Volume paths are host-relative**: All `volumes:` mounts reference ~/home-server/<app>/config: which maps to actual local directories on remote SSD/NAS storage mounted under /mnt/raid namespace during compose plugin runtime at deploy step  

## Code Style

Follow the patterns defined in `.editorconfig`:
- YAML files use **2-space indentation** with no trailing whitespace  
- Shell scripts use bash conventions (local variable scoping, uppercase constant names)  
- Terraform configs follow HashiCorp style guides with descriptive resource naming and comments for non-obvious configuration blocks only  
