terraform {
  required_version = "~> 1.10"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.2.0"
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
