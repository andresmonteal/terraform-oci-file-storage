locals {
  default_freeform_tags = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-oci-file-storage"
  }
  merged_freeform_tags = merge(var.freeform_tags, local.default_freeform_tags)
  ADs = [
    # Iterate through data.oci_identity_availability_domains.ad and create a list containing AD names
    for i in data.oci_identity_availability_domains.ad.availability_domains : i.name
  ]
  ad_number = element(local.ADs, var.ad_number - 1)
}

# This resource provides the Mount Target resource in Oracle Cloud Infrastructure File Storage service.
resource "oci_file_storage_mount_target" "main" {
  #Required
  availability_domain = local.ad_number
  compartment_id      = var.compartment_id
  subnet_id           = var.subnet_id

  display_name = var.display_name

  #Optional
  defined_tags  = var.defined_tags
  freeform_tags = local.merged_freeform_tags
}

# This module provides the File System resource in Oracle Cloud Infrastructure File Storage service & export paths.
module "file_system" {
  source = "./file_system"

  for_each = var.file_systems

  #Required
  availability_domain = local.ad_number
  compartment_id      = data.oci_identity_compartments.cmp_lvl3[each.key].compartments[0].id
  display_name        = each.key
  mount_target_id     = oci_file_storage_mount_target.main.id

  #Optional
  defined_tags  = each.value["defined_tags"]
  freeform_tags = local.merged_freeform_tags

  exports = can(each.value["exports"]) ? each.value["exports"] : {}
}