resource "cloudflare_dns_record" "root_a" {
  provider = cloudflare.dev

  name    = "davydehaas.dev"
  ttl     = 1
  type    = "A"
  zone_id = var.zone_id

  content = var.ipv4_address
  proxied = true
}

resource "cloudflare_dns_record" "root_aaaa" {
  provider = cloudflare.dev

  name    = "davydehaas.dev"
  ttl     = 1
  type    = "AAAA"
  zone_id = var.zone_id

  content = var.ipv6_address
  proxied = true
}

resource "cloudflare_dns_record" "root_caa_issue" {
  provider = cloudflare.dev

  name    = "davydehaas.dev"
  ttl     = 1
  type    = "CAA"
  zone_id = var.zone_id

  comment = "Allow Let's Encrypt (cert-manager) to issue certificates"
  data = {
    flags = 0
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_dns_record" "root_caa_issuewild" {
  provider = cloudflare.dev

  name    = "davydehaas.dev"
  ttl     = 1
  type    = "CAA"
  zone_id = var.zone_id

  comment = "Allow Let's Encrypt (cert-manager) to issue wildcard certificates"
  data = {
    flags = 0
    tag   = "issuewild"
    value = "letsencrypt.org"
  }
}
