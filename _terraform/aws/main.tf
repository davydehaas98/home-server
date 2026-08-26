terraform {
  required_version = "~> 1.10"

  backend "s3" {
    bucket         = "davydehaas-terraform-state"
    key            = "aws/terraform.tfstate"
    region         = "eu-central-1"
    use_lockfile   = true
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.56.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "ManagedBy" = "Terraform"
    }
  }
}
