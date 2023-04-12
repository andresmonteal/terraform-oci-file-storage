# This resource provides the File System resource in Oracle Cloud Infrastructure File Storage service.
resource "oci_file_storage_file_system" "main" {
    #Required
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id

    display_name = var.display_name

    #Optional
    defined_tags = var.defined_tags
    freeform_tags = var.freeform_tags
}

# This resource provides the Export Set resource in Oracle Cloud Infrastructure File Storage service.
module "exports" {
    source = "../export"

    for_each = var.exports

    #Required
    mount_target_id = var.mount_target_id
    display_name = each.key
    file_system_id = oci_file_storage_file_system.main.id
    
    paths = can(each.value["paths"]) ? each.value["paths"] : {}
}