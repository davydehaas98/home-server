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
      version = "8.29.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy
  user_ocid        = var.user
  fingerprint      = var.fingerprint
  private_key_path = var.key_file
  region           = var.region

  ignore_defined_tags = [
    "Oracle-Tags.CreatedBy",
    "Oracle-Tags.CreatedOn"
  ]
}
