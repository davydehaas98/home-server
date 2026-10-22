resource "cloudflare_dns_record" "actual" {
  provider = cloudflare.nl

  name    = "actual"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "adguard" {
  provider = cloudflare.nl

  name    = "adguard"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "adguardhome" {
  provider = cloudflare.nl

  name    = "adguardhome"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "ai" {
  provider = cloudflare.nl

  name    = "ai"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "auth" {
  provider = cloudflare.nl

  name    = "auth"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "authelia" {
  provider = cloudflare.nl

  name    = "authelia"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "authentik" {
  provider = cloudflare.nl

  name    = "authentik"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "boinc" {
  provider = cloudflare.nl

  name    = "boinc"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "books" {
  provider = cloudflare.nl

  name    = "books"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "budget" {
  provider = cloudflare.nl

  name    = "budget"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "cadvisor" {
  provider = cloudflare.nl

  name    = "cadvisor"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "cloud" {
  provider = cloudflare.nl

  name    = "cloud"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "code" {
  provider = cloudflare.nl

  name    = "code"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "duplicati" {
  provider = cloudflare.nl

  name    = "duplicati"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "dvr" {
  provider = cloudflare.nl

  name    = "dvr"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "foundry_cos" {
  provider = cloudflare.nl

  name    = "foundry-cos"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "grafana" {
  provider = cloudflare.nl

  name    = "grafana"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "homebridge" {
  provider = cloudflare.nl

  name    = "homebridge"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "jackett" {
  provider = cloudflare.nl

  name    = "jackett"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "jaeger" {
  provider = cloudflare.nl

  name    = "jaeger"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "memos" {
  provider = cloudflare.nl

  name    = "memos"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "minecraft" {
  provider = cloudflare.nl

  name    = "minecraft"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "minecraft_skyfactory" {
  provider = cloudflare.nl

  name    = "minecraft-skyfactory"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "oauth" {
  provider = cloudflare.nl

  name    = "oauth"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "ollama" {
  provider = cloudflare.nl

  name    = "ollama"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "open_webui" {
  provider = cloudflare.nl

  name    = "open-webui"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "openvpn" {
  provider = cloudflare.nl

  name    = "openvpn"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "pihole" {
  provider = cloudflare.nl

  name    = "pihole"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "plex" {
  provider = cloudflare.nl

  name    = "plex"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "portainer" {
  provider = cloudflare.nl

  name    = "portainer"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "prometheus" {
  provider = cloudflare.nl

  name    = "prometheus"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "qbittorrent" {
  provider = cloudflare.nl

  name    = "qbittorrent"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "readarr" {
  provider = cloudflare.nl

  name    = "readarr"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "statping" {
  provider = cloudflare.nl

  name    = "statping"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "status" {
  provider = cloudflare.nl

  name    = "status"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "tabby" {
  provider = cloudflare.nl

  name    = "tabby"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "tdarr" {
  provider = cloudflare.nl

  name    = "tdarr"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "torrent" {
  provider = cloudflare.nl

  name    = "torrent"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "traefik" {
  provider = cloudflare.nl

  name    = "traefik"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "transcoder" {
  provider = cloudflare.nl

  name    = "transcoder"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "transmission" {
  provider = cloudflare.nl

  name    = "transmission"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "vpn" {
  provider = cloudflare.nl

  name    = "vpn"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = false
}

resource "cloudflare_dns_record" "wireguard" {
  provider = cloudflare.nl

  name    = "wireguard"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = false
}

resource "cloudflare_dns_record" "www" {
  provider = cloudflare.nl

  name    = "www"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "xteve" {
  provider = cloudflare.nl

  name    = "xteve"
  ttl     = 1
  type    = "CNAME"
  zone_id = var.zone_id

  content = "davydehaas.nl"
  proxied = true
}

resource "cloudflare_dns_record" "factorio_srv" {
  provider = cloudflare.nl

  name     = "_factorio._tcp.factorio"
  ttl      = 1
  type     = "SRV"
  zone_id  = var.zone_id
  priority = 0

  comment = "Factorio server"
  data = {
    port     = 34197
    priority = 0
    weight   = 0
    target   = "factorio.davydehaas.nl"
  }
}

resource "cloudflare_dns_record" "minecraft_srv" {
  provider = cloudflare.nl

  name     = "_minecraft._tcp.minecraft"
  ttl      = 1
  type     = "SRV"
  zone_id  = var.zone_id
  priority = 0

  comment = "Minecraft Vanilla server"
  data = {
    port     = 25565
    priority = 0
    weight   = 0
    target   = "minecraft.davydehaas.nl"
  }
}

resource "cloudflare_dns_record" "better_minecraft_srv" {
  provider = cloudflare.nl

  name     = "_minecraft._tcp.better-minecraft"
  ttl      = 1
  type     = "SRV"
  zone_id  = var.zone_id
  priority = 0

  comment = "Minecraft Better Minecraft server"
  data = {
    port     = 25566
    priority = 0
    weight   = 0
    target   = "better-minecraft.davydehaas.nl"
  }
}

resource "cloudflare_dns_record" "minecraft_arachne_srv" {
  provider = cloudflare.nl

  name     = "_minecraft._tcp.minecraft-arachne"
  ttl      = 1
  type     = "SRV"
  zone_id  = var.zone_id
  priority = 0

  comment = "Minecraft Arachne server"
  data = {
    port     = 25567
    priority = 0
    weight   = 0
    target   = "minecraft-arachne.davydehaas.nl"
  }
}

resource "cloudflare_dns_record" "minecraft_skyfactory_srv" {
  provider = cloudflare.nl

  name     = "_minecraft._tcp.minecraft-skyfactory"
  ttl      = 1
  type     = "SRV"
  zone_id  = var.zone_id
  priority = 0

  comment = "Minecraft SkyFactory server"
  data = {
    port     = 25568
    priority = 0
    weight   = 0
    target   = "minecraft-skyfactory.davydehaas.nl"
  }
}

# Prevent email spoofing

# Sender Policy Framework (SPF)
# https://en.wikipedia.org/wiki/Sender_Policy_Framework
resource "cloudflare_dns_record" "spf1" {
  provider = cloudflare.nl

  name    = "davydehaas.nl"
  ttl     = 1
  type    = "TXT"
  zone_id = var.zone_id

  comment = "SPF record to allow Cloudflare Email Routing"
  content = "\"v=spf1 include:_spf.mx.cloudflare.email ~all\""
}

# Domain-based Message Authentication, Reporting and Conformance (DMARC)
# https://en.wikipedia.org/wiki/DMARC
resource "cloudflare_dns_record" "dmarc" {
  provider = cloudflare.nl

  name    = "_dmarc"
  ttl     = 1
  type    = "TXT"
  zone_id = var.zone_id

  comment = "DMARC record to prevent email spoofing"
  content = "\"v=DMARC1; p=reject; adkim=r; aspf=r;\""
}

# DomainKeys Identified Mail (DKIM)
# https://en.wikipedia.org/wiki/DomainKeys_Identified_Mail
resource "cloudflare_dns_record" "dkim1" {
  provider = cloudflare.nl

  name    = "*._domainkey"
  ttl     = 1
  type    = "TXT"
  zone_id = var.zone_id

  comment = "DKIM record to prevent email spoofing"
  content = "\"v=DKIM1; p=\""
}

resource "cloudflare_dns_record" "dkim_cf2024" {
  provider = cloudflare.nl

  name    = "cf2024-1._domainkey"
  ttl     = 1
  type    = "TXT"
  zone_id = var.zone_id

  content = "\"v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiweykoi+o48IOGuP7GR3X0MOExCUDY/BCRHoWBnh3rChl7WhdyCxW3jgq1daEjPPqoi7sJvdg5hEQVsgVRQP4DcnQDVjGMbASQtrY4WmB1VebF+RPJB2ECPsEDTpeiI5ZyUAwJaVX7r6bznU67g7LvFq35yIo4sdlmtZGV+i0H4cpYH9+3JJ78k\" \"m4KXwaf9xUJCWF6nxeD+qG6Fyruw1Qlbds2r85U9dkNDVAS3gioCvELryh1TxKGiVTkg4wqHTyHfWsp7KD3WQHYJn0RyfJJu6YEmL77zonn7p2SRMvTMP3ZEXibnC9gz3nnhR6wcYL8Q7zXypKTMD58bTixDSJwIDAQAB\""
}
