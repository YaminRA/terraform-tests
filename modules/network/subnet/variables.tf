variable "rg_name" {
  description = "Resource Group where VNet lives"
  type        = string
}

variable "vnet_name" {
  description = "VNet where Subnet will be deployed"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name that will be deployed"
  type        = string
}

variable "subnet_pool" {
  description = "Subnet pool name prefix"
  type        = string
}

variable "subnet_cidr" {
    description = "Subnet address ranges for Solr resources"
    type = list(string)
}
