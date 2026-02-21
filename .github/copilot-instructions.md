# Copilot Instructions for home-server

## Project Overview
This is a self-hosted home server infrastructure project using Docker Compose, Terraform, and various services (monitoring, media, reverse proxy, etc.).

## Code Style & Standards

### General
- Use clear, descriptive variable and function names
- Keep functions/scripts focused on a single responsibility
- Add comments for complex logic
- Prefer explicit configuration over magic values

### YAML (Docker Compose & Terraform)
- Use 2-space indentation
- Keep service definitions organized and readable
- Group related configuration blocks
- Add comments for non-obvious settings

### Shell Scripts
- Use bash/sh for portability
- Include shebang line (`#!/bin/bash`)
- Quote variables to prevent word splitting
- Use meaningful variable names in UPPERCASE for constants

### Terraform
- Follow HashiCorp Terraform conventions
- Organize providers, variables, and resources logically
- Use meaningful names for resources and variables
- Include descriptions for variable inputs

## Project Structure

```
home-server/
├── home-stack/          # Core services (monitoring, media, etc.)
├── media-stack/         # Media-related containers
├── reverse-proxy-stack/ # Reverse proxy configuration
├── _terraform/          # Infrastructure as Code (AWS, OCI, Cloudflare)
└── .github/             # GitHub configuration and documentation
```

- Configuration files go in `/config/` within each stack
- Disabled services in `disabled/` folder, enabled in `enabled/`
- Infrastructure code in `_terraform/`

## Technologies & Preferences

### Container Orchestration
- Primary: Docker Compose
- Use externally defined networks where appropriate
- Include health checks for all services
- Set resource limits (CPU, memory)
- Use volume mounts for persistent data at `~/home-server/`

### Monitoring & Observability
- Prometheus for metrics collection
- Grafana for visualization
- AlertManager for alerting
- Include health checks in all services

### Services Configuration
- Use environment variables for dynamic values
- Store secrets separately from compose files
- Use `.env` files for local development
- Template sensitive configs in `compose.template.yaml`

### Infrastructure
- Use Terraform for cloud resources (AWS, OCI, Cloudflare)
- Manage state in `_terraform/`
- Separate concerns by cloud provider/service

## Configuration Management

- Use `compose.template.yaml` for template definitions
- Use environment variables for domain names (e.g., `${DOMAIN_NAME}`)
- Label services appropriately for Traefik reverse proxy
- Configure Traefik routing rules consistently

## Security

- Never hardcode secrets, API keys, or credentials
- Use Docker secrets or environment variables
- Restrict network exposure through reverse proxy
- Implement authentication via Traefik middlewares
- Run services with minimal required privileges

## Reverse Proxy (Traefik)

- All external services should route through Traefik
- Use consistent labeling:
  - `traefik.enable: true`
  - `traefik.http.routers.<service>.rule`
  - `traefik.http.services.<service>.loadbalancer.server.port`
- Use secure entry points (websecure)
- Apply appropriate middleware chains

## Adding New Services

1. Create `compose.<service>.yaml` in appropriate stack
2. Add to `enabled/` or `disabled/` folder
3. Configure health checks
4. Set resource limits
5. Add Traefik labels if externally accessible
6. Update documentation if needed

## Documentation

- Update README.md when adding features or services
- Include service descriptions and purposes
- Document port mappings in comments
- Include setup instructions for complex services

## Common Patterns

### Health Checks
```yaml
healthcheck:
  test: ["CMD", "curl", "--fail", "http://service:port/health"]
  interval: 30s
  timeout: 10s
  retries: 3
  start_period: 30s
```

### Resource Limits
```yaml
deploy:
  resources:
    limits:
      cpus: '2.0'
      memory: 4G
    reservations:
      cpus: '1.0'
      memory: 2G
```

### Traefik Configuration
```yaml
labels:
  traefik.enable: true
  traefik.http.routers.<service>.entrypoints: websecure
  traefik.http.routers.<service>.rule: Host(`<service>.${DOMAIN_NAME}`)
  traefik.http.routers.<service>.middlewares: chain-no-auth@file
  traefik.http.services.<service>.loadbalancer.server.port: 8080
```

## General Guidelines

- Keep configurations DRY (Don't Repeat Yourself)
- Use descriptive names for services, volumes, and networks
- Test changes before deploying to production
- Maintain backward compatibility when updating services
- Document non-obvious configuration choices
