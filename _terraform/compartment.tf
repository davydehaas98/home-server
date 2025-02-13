resource "oci_identity_compartment" "tf-compartment" {
    compartment_id = var.tenancy_ocid
    description = "Compartment for Terraform resources."
    name = "test-compartment"
}

output "compartments" {
  value = data.oci_identity_compartments.compartments1.compartments
}
