variable "prefix" {}

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "api_fingerprint" {}
variable "api_private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}
variable "ssh_public_key_path" {}

# Defines the number of instances to deploy
variable "NumInstances" {
  default = "1"
}

# Choose an Availability Domain
variable "ad_number" {
  default = "1"
}

variable "compute_shape" {
  default = "VM.Standard.E2.1"
}

// https://docs.cloud.oracle.com/en-us/iaas/images/
// Oracle-Linux-7.8-2020.06.09-0
variable "images" {
  type = map(string)

  default = {
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaoqvlhn5rykcekppqb4rddvkoz6667rho62q2teavlqemlcqvodca"
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaafuajqx2e5flx2qcv4c3bh3s5nzu4kinml4z2qdotte4kugydyhna"
  }
}
