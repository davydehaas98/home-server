resource "oci_identity_compartment" "tf-compartment" {
    compartment_id = var.tenancy
    description = "Compartment for Terraform resources."
    name = "tf-compartment"
}

# data "oci_identity_compartments" "name" {
#   compartment_name = oci_identity_compartment.tf-compartment.name
# }

data "oci_identity_compartments" "id" {
  compartment_id = oci_identity_compartment.tf-compartment.id
}
