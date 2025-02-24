provider "cloudflare" {
  alias     = "dev"
  api_token = var.cloudflare_api_token
}
