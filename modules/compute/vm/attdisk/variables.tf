variable "disk_id" {
  description = "The ID of an existing Managed Disk which should be attached"
  type        = string
}

variable "vm_id" {
  description = "The ID of the Virtual Machine to which the Data Disk should be attached"
  type        = string
}

variable "disk_lun" {
  description = "The Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine"
  type        = string
}

variable "disk_caching" {
  description = "Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite"
  type        = string
}