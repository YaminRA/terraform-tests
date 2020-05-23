variable "name" {
  description = "The name of the subnet"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the subnet"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network to which to attach the subnet"
  type        = string
}

variable "address_cidr" {
  description = "The address prefixes to use for the subnet"
  type        = list(string)
}
