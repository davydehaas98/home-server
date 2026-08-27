terraform {
  required_version = "~> 1.15"

  backend "s3" {
    bucket         = "davydehaas-terraform-state"
    key            = "cloudflare/davydehaas.dev/terraform.tfstate"
    region         = "eu-central-1"
    use_lockfile   = true
    encrypt        = true
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.22.0"
    }
  }
}

provider "cloudflare" {
  alias     = "dev"
  api_token = var.cloudflare_api_token
}
