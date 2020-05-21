variable "rg_name" {
  description = "Resource Group where Availability Set will be deployed"
  type        = string
}

variable "location" {
  description = "Location where the Key Vault will be deployed"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "Subnet to attach Load Balancer"
  type        = string
}

variable "private_address_allocation" {
  description = "Dynamic or Static"
  type        = string
}

variable "ip_address" {
  description = "Private IP address for Load Balancer"
  type        = string
}