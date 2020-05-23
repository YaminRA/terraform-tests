variable "ipc_name" {
  description = "The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool"
  type        = string
}

variable "nic_id" {
  description = "The ID of the Network Interface"
  type        = string
}

variable "bap_id" {
  description = "The ID of the Load Balancer Backend Address Pool which this Network Interface which should be connected to"
  type        = string
}