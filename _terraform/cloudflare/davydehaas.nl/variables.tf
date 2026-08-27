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
  default     = "5ff3d3cef9bdf0f486f79115aadc9504"
}
