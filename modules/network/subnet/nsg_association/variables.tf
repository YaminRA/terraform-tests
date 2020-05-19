variable "subnet_id" {
  description = "Subnet to attach to NSG"
  type        = string
}

variable "nsg_id" {
  description = "NSG ID to attach to network resources"
  type        = string
}