terraform {
  required_version = "~> 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.90.1"
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
