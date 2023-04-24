data "oci_identity_compartments" "cmp_lvl1" {
  for_each = var.file_storages
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = each.value["cmp"][0]
}

data "oci_identity_compartments" "cmp_lvl2" {
  for_each = var.file_storages
  #Required
  compartment_id = data.oci_identity_compartments.cmp_lvl1[each.key].compartments[0].id

  #Optional
  name = each.value["cmp"][1]
}

data "oci_identity_compartments" "cmp_lvl3" {
  for_each = var.file_storages
  #Required
  compartment_id = data.oci_identity_compartments.cmp_lvl2[each.key].compartments[0].id

  #Optional
  name = each.value["cmp"][2]
}

data "oci_identity_compartments" "network_cmp" {

  for_each = var.file_storages
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  name = each.value["network_cmp"]
}


data "oci_core_subnets" "subnet" {
  for_each = var.file_storages
  #Required
  compartment_id = data.oci_identity_compartments.network_cmp[each.key].compartments[0].id

  #Optional
  display_name = each.value["subnet"]
}