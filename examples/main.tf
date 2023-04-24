module "oci-file-storage" {
  source = "git::ssh://devops.scmservice.us-ashburn-1.oci.oraclecloud.com/namespaces/id9de6bj2yv6/projects/claro-devops/repositories/terraform-oci-file-storage?ref=v0.1.1"

  for_each = var.file_storages

  # mount target
  tenancy_ocid   = var.tenancy_ocid
  compartment_id = data.oci_identity_compartments.cmp_lvl3[each.key].compartments[0].id
  subnet_id      = data.oci_core_subnets.subnet[each.key].subnets[0].id
  display_name   = each.key
  ad_number      = each.value["ad_number"]

  defined_tags  = lookup(each.value, "defined_tags", {})
  freeform_tags = lookup(each.value, "freeform_tags", {})

  # file system and optinal paths
  file_systems = lookup(each.value, "file_systems", {})

}