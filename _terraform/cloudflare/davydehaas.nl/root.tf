resource "cloudflare_dns_record" "root_a" {
  provider = cloudflare.nl

  name    = "davydehaas.nl"
  ttl     = 1
  type    = "A"
  zone_id = var.zone_id

  content = var.ipv4_address
  proxied = true
}

resource "cloudflare_dns_record" "root_aaaa" {
  provider = cloudflare.nl

  name    = "davydehaas.nl"
  ttl     = 1
  type    = "AAAA"
  zone_id = var.zone_id

  content = var.ipv6_address
  proxied = true
}

resource "cloudflare_dns_record" "root_caa" {
  provider = cloudflare.nl

  name    = "davydehaas.nl"
  ttl     = 1
  type    = "CAA"
  zone_id = var.zone_id

  data = {
    flags = 0
    tag   = "issue"
    value = "davydehaas.nl"
  }
}
