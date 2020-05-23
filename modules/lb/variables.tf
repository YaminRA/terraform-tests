variable "name" {
  description = "Specifies the name of the Load Balancer"
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group in which to create the Load Balancer"
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure Region where the Load Balancer should be created"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic and Standard"
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "fe_ipc_name" {
  description = "Specifies the name of the frontend ip configuration"
  type        = string
}

variable "subnet_id" {
  description = " The ID of the Subnet which should be associated with the IP Configuration"
  type        = string
}

variable "private_ip_allocation" {
  description = "The allocation method for the Private IP Address used by this Load Balancer. Possible values as Dynamic and Static"
  type        = string
}

variable "private_ip" {
  description = " Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned"
  type        = string
}