variable "availability_domain" {
  description = "(Required) The availability domain in which to create the file storage resources."
  type        = string
}

variable "compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment in which to create the file storage resources."
  type        = string
}

#optional
variable "display_name" {
  description = "(Optional) (Updatable) A user-friendly name. It does not have to be unique, and it is changeable."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = {}
}

variable "exports" {
  description = "(Optional) provides the export set and path resources in Oracle Cloud Infrastructure."
  type        = map(any)
  default     = {}
}

variable "mount_target_id" {
  description = "(Required) (Updatable) The OCID of the mount target that the export set is associated with."
  type        = string
  default     = null
}
