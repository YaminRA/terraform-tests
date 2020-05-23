variable "name" {
  description = "The name of the Network Interface"
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group in which to create the Network Interface"
  type        = string
}

variable "location" {
  description = "The location where the Network Interface should exist"
  type        = string
}

variable "ipc_name" {
  description = "A name used for this IP Configuration"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet where this Network Interface should be located in"
  type        = string
}

variable "private_ip_allocation" {
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
  type        = string
}

variable "private_ip" {
  description = "The Static IP Address which should be used"
  type        = string
}

variable "pip_id" {
  description = "Reference to a Public IP Address to associate with this NIC"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}