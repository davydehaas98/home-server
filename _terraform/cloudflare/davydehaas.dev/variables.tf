variable "cloudflare_api_token" {
  description = "Cloudflare API token"
}

variable "ipv4_address" {
  description = "Server IPv4 address"
}

variable "ipv6_address" {
  description = "Server IPv6 address"
}

variable "zone_id" {
  description = "Cloudflare Zone ID"
  default     = "01af14b5b71f5639198aaca16f0b38f6"
}
