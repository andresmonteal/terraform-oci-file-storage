# This resource provides the Export Set resource in Oracle Cloud Infrastructure File Storage service.
resource "oci_file_storage_export_set" "main" {
    #Required
    mount_target_id = var.mount_target_id

    #Optional
    display_name = var.display_name
}

# This resource provides the Export resource in Oracle Cloud Infrastructure File Storage service.
resource "oci_file_storage_export" "main" {
    for_each = var.paths

    #Required
    export_set_id = oci_file_storage_export_set.main.id
    file_system_id = var.file_system_id
    path = each.key
    
    #Optional
    export_options {
        #Required
        source = lookup(each.value, "source", "0.0.0.0/0")

        #Optional
        access = lookup(each.value, "source", "READ_WRITE")
        anonymous_gid = lookup(each.value, "anonymous_gid", null)
        anonymous_uid = lookup(each.value, "anonymous_uid", null)
        identity_squash = lookup(each.value, "identity_squash", "NONE")
        require_privileged_source_port = lookup(each.value, "require_privileged_source_port", "false")
    }
}