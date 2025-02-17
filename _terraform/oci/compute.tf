data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy
}

output "name-of-first-availability-domain" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

# resource "oci_core_instance" "ubuntu_instance" {
#     # Required
#     availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
#     compartment_id = var.compartment_id
#     shape = "VM.Standard.E2.1.Micro"
#     shape_config {
#         ocpus = "1"
#         memory_in_gbs = "1"
#     }
#     source_details {
#         source_id = "<source-ocid>"
#         source_type = "image"
#     }

#     # Optional
#     # display_name = "<your-ubuntu-instance-name>"
#     # create_vnic_details {
#     #     assign_public_ip = true
#     #     subnet_id = "<subnet-ocid>"
#     # }
#     # metadata = {
#     #     ssh_authorized_keys = file("<ssh-public-key-path>")
#     # } 
#     # preserve_boot_volume = false
# }
