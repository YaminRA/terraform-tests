variable "subnet_id" {
  description = "The ID of the Subnet"
  type        = string
}

variable "nsg_id" {
  description = "The ID of the Network Security Group which should be associated with the Subnet"
  type        = string
}