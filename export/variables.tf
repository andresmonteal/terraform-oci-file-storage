variable "mount_target_id" {
  description = "(Required) (Updatable) The OCID of the mount target that the export set is associated with."
  type        = string
}


#optional
variable "display_name" {
  description = "(Optional) (Updatable) A user-friendly name. It does not have to be unique, and it is changeable."
  type        = string
  default = null
}

variable "file_system_id" {
  description = "(Required) The OCID of this export's file system."
  type        = string
  default = null
}

variable "paths" {
  description = "(Optional) provides the export path resources in Oracle Cloud Infrastructure."
  type        = map(any)
  default     = {}
}