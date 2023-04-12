# Get all the Availability Domains for the region and default backup policies
data "oci_identity_availability_domains" "ad" {
  compartment_id = var.tenancy_ocid
}

data "oci_identity_compartments" "cmp_lvl1" {
  for_each = var.file_systems
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = each.value["cmp"][0]
}

data "oci_identity_compartments" "cmp_lvl2" {
  for_each = var.file_systems
  #Required
  compartment_id = data.oci_identity_compartments.cmp_lvl1[each.key].compartments[0].id

  #Optional
  name = each.value["cmp"][1]
}

data "oci_identity_compartments" "cmp_lvl3" {
  for_each = var.file_systems
  #Required
  compartment_id = data.oci_identity_compartments.cmp_lvl2[each.key].compartments[0].id

  #Optional
  name = each.value["cmp"][2]
}