variable "name" {
  description = "Name of NSG Rule"
  type        = string
}

variable "rg_name" {
  description = "Resource Group where NSG will be deployed"
  type        = string
}

variable "nsg_name" {
  description = "NSG name which rule will be attached to"
  type        = string
}

variable "priority" {
  description = "Rule priority"
  type        = number
}

variable "direction" {
  description = "Inbound or Outbound rule"
  type        = string
}

variable "access" {
  description = "Allow or Deny rule"
  type        = string
}

variable "protocol" {
  description = "Protocol which rule applies"
  type        = string
}

variable "source_port_range" {
  description = "Port range where calls originate"
  type        = string
}

variable "destination_port_range" {
  description = "Destination port ranges"
  type        = string
}

variable "source_address_prefix" {
  description = "IP address range where calls originate"
  type        = string
}

variable "destination_address_prefix" {
  description = "Destination IP address ranges"
  type        = string
}