# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`home-server` is a Docker Compose monorepo for self-hosting applications on a home Ubuntu Server box, plus a small set of Terraform stacks for the cloud-side pieces (DNS, OIDC roles, budget alerts). There is no application code and no build/test tooling — the two things you edit are Compose YAML and Terraform HCL, and the two things that ship them are GitHub Actions workflows.

## Repository Structure

- `home-stack/`, `media-stack/`, `reverse-proxy-stack/` — one `compose.<service>.yaml` file per service (e.g. `compose.jellyfin.yaml`), plus:
  - `config/` — host-side persistent volume data (git-ignored, lives only on the server)
  - `disabled/` — retired compose files kept for reference, not deployed
- `compose.template.yaml` — reference snippet showing the conventions every service compose file follows (see below). Not included/merged by Compose; it's a copy-paste template.
- `_terraform/` — independent Terraform stacks (see below)
- `.github/workflows/` — one deploy workflow per stack, one plan/apply workflow per Terraform stack
- `diagrams/` — PlantUML architecture diagrams
- `create-user.sh` — one-time script to create the `homelab` service user on a fresh server

## Deployment

Each stack (`home-stack`, `media-stack`, `reverse-proxy-stack`) has its own workflow in `.github/workflows/<stack>.yaml`, triggered on push to `main` when files under that stack's path change (path-filtered), or manually via `workflow_dispatch`. Each workflow:

1. rsyncs only `compose.*.yaml` from the stack folder to the server (`--include='/compose.*.yaml' --exclude='/*'`) — `config/` and `disabled/` are never touched by CI
2. SSHes in as the `homelab` user and runs `docker compose -f compose.a.yaml -f compose.b.yaml ... up -d --remove-orphans` over every `compose.*.yaml` in the target directory, then `docker image prune -a -f`

There is no `_deploy.sh` — the rsync/SSH steps are inlined in each workflow file. Editing deploy behavior means editing the workflow YAML directly (and keeping the three stack workflows consistent with each other, since they're near-duplicates).

To add a new service: drop a new `compose.<service>.yaml` into the right stack folder and push to `main` — no other registration step exists.

## Compose Conventions

`compose.template.yaml` documents the shape every service should follow. Key points:

- Field order: `image, container_name, privileged, pid, user, cap_add, security_opt, ulimits, shm_size, devices, sysctls, ports, networks, volumes, env_file, environment, command, labels, depends_on, healthcheck, deploy` — omit fields that don't apply, but keep the rest in this relative order. Restart policy always lives under `deploy.restart_policy`, never as a top-level `restart:` key
- `container_name` matches the compose filename's service key
- `user: ${UID}:${GID}`, with `PUID`/`PGID`/`TZ` passed via `environment:` — these come from the server's real environment/`.env`, not from GitHub Actions secrets
- Traefik service discovery via labels, not host port bindings: `traefik.enable`, a `Host(...)` router rule using `${DOMAIN_NAME}`, and `chain-authentik@file` as the middleware for anything that needs SSO
- A `healthcheck:` block (typically `curl --fail` against the service)
- `deploy.restart_policy` and `deploy.resources.limits`/`reservations` (CPU/memory)
- Volumes follow `~/home-server/<app>/config:...` (host-relative) or `/mnt/storage/...` (bulk media storage) patterns

## Terraform (`_terraform/`)

Independent stacks, each with its own S3 backend state (bucket `davydehaas-terraform-state`, keyed by stack path) and its own GitHub Actions workflow (path-filtered per stack) that runs `init` → `validate` → `plan` on every push to `main`, and additionally `apply -auto-approve` on that saved plan when the workflow is triggered manually (`workflow_dispatch`) with the `apply` input set to `true` — a plain push to `main` never applies:

- `aws/` — budget alerting
- `cloudflare/davydehaas.dev/`, `cloudflare/davydehaas.nl/` — DNS records for the two domains
- `oci/` — Oracle Cloud compartment/compute
- `bootstrap/` — creates the shared state bucket and the per-stack GitHub Actions OIDC roles (one role per stack, scoped to that stack's own state prefix). This stack is applied **locally by hand only, never via CI** — see `_terraform/bootstrap/BOOTSTRAP.md` for the full one-time setup and how to make later changes to it.

CI authenticates to AWS via OIDC (`role-to-assume`, built from a hardcoded role name + the `AWS_ACCOUNT_ID` secret) — no static AWS credentials in CI. `terraform fmt` and `terraform validate` are expected to pass before merging.

## File Conventions

`.editorconfig` governs formatting; do not deviate:
- Default: 4-space indent
- YAML (`*.yml`/`*.yaml`), including all compose files: **2-space indent**
- Markdown: 4-space indent, trailing whitespace preserved
- Shell scripts: LF line endings
