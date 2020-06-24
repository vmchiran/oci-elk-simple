resource "oci_core_instance" "ELK" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "${var.prefix}-ELK"
  shape               = var.compute_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.ELKSubnet.id
    # display_name     = "primaryvnic"
    assign_public_ip = true
    # hostname_label   = "elk-${count.index}"
  }

  source_details {
    source_type = "image"
    source_id   = var.images[var.region]
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
    user_data           = base64encode(file("./scripts/elk.sh"))
  }
}
