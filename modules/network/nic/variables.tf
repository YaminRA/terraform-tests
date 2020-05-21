variable "rg_name" {
  description = "Resource Group where Availability Set will be deployed"
  type        = string
}

variable "nic_prefix" {
  description = "Prefix name for NIC"
  type        = string
}

variable "location" {
  description = "The location where the Network Interface should exist"
  type        = string
}

variable "ip_name" {
  description = "Name used for this IP Configuration"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet where this Network Interface should be located in"
  type        = string
}

variable "nic_ipconfig" {
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
  type        = string
}

variable "nic_ip" {
  description = "The Static IP Address which should be used"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}