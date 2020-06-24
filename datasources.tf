# Gets a list of Availability Domains
data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.ad_number
}

data "oci_core_vnic_attachments" "elk_vnics" {
  compartment_id      = var.compartment_ocid
  availability_domain = data.oci_identity_availability_domain.ad.name
  instance_id         = oci_core_instance.ELK.id
}

data "oci_core_vnic" "elk_vnic" {
  vnic_id = lookup(data.oci_core_vnic_attachments.elk_vnics.vnic_attachments[0], "vnic_id")
}
