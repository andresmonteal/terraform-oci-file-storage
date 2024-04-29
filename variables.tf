# required
variable "tenancy_ocid" {
  description = "(Required) The OCID of the root compartment."
  type        = string
}

variable "ad_number" {
  description = "(Required) The availability domain in which to create the file storage resources."
  type        = number
}

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  default     = null
}

variable "compartment" {
  description = "compartment name where to create all resources"
  type        = string
  default     = null
}

variable "network_cmp" {
  description = "Compartment name for networking resources"
  type        = string
  default     = null
}

variable "network_cmp_id" {
  description = "Compartment id for networking resources"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "(Optional) The OCID of the regional subnet in which to place the file storage resources."
  default     = ""
  type        = string
}

variable "subnet_name" {
  description = "Virtual cloud network subnet name"
  default     = ""
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

variable "file_systems" {
  description = "(Optional) provides the file system resource in Oracle Cloud Infrastructure."
  type        = map(any)
  default     = {}
}