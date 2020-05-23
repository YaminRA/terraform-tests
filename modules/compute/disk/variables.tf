variable "name" {
  description = "Specifies the name of the Managed Disk"
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group where the Managed Disk should exist"
  type        = string
}

variable "location" {
  description = "Specified the supported Azure location where the resource exists"
  type        = string
}

variable "sa_type" {
  description = "The type of storage to use for the managed disk. Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS"
  type        = string
}

variable "create_option" {
  description = "The method to use when creating the managed disk. Possible values are Import, Empty, Copy, FromImage and Restore"
  type        = string
}

variable "size" {
  description = "Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased"
  type        = number
}