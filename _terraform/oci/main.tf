terraform {
  required_version = "~> 1.15"

  backend "s3" {
    bucket       = "davydehaas-terraform-state"
    key          = "oci/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "9.1.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key      = var.private_key
  region           = var.region

  ignore_defined_tags = [
    "Oracle-Tags.CreatedBy",
    "Oracle-Tags.CreatedOn"
  ]
}
