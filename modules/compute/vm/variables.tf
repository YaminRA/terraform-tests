variable "rg_name" {
  description = "The name of the Resource Group in which the Linux Virtual Machine should exist"
  type        = string
}

variable "location" {
  description = "The Azure location where the Linux Virtual Machine should exist"
  type        = string
}

variable "vm_prefix" {
  description = "Prefix name of VM to deploy"
  type        = string
}

variable "size" {
  description = "The SKU which should be used for this Virtual Machine, such as Standard_D4s_v3"
  type        = string
}

variable "vm_admin_username" {
  description = "The username of the local administrator used for the Virtual Machine"
  type        = string
}

variable "vm_admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  type        = string
}

variable "nic_id" {
    description = "A list of Network Interface ID's which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine"
    type = string
}

variable "avs_id" {
    description = "Specifies the ID of the Availability Set in which the Virtual Machine should exist"
    type = string
}

variable "os_caching" {
    description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite"
    type = string
}

variable "sa_type" {
    description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
    type = string
}

variable "publisher" {
  description = "Specifies the publisher of the image used to create the virtual machines"
  type        = string
}

variable "offer" {
  description = "Specifies the offer of the image used to create the virtual machines"
  type        = string
}

variable "sku" {
  description = "Specifies the SKU of the image used to create the virtual machines"
  type        = string
}

variable "os_version" {
  description = "Specifies the version of the image used to create the virtual machines"
  type        = string
}

variable "custom_data" {
  description = "Specifies custom data to supply to the machine. On Linux-based systems, this can be used as a cloud-init script. On other systems, this will be copied as a file on disk. Internally, Terraform will base64 encode this value before sending it to the API. The maximum length of the binary array is 65535 bytes"
  type        = string
  default = ""
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type = map(string)
  default = {}
}