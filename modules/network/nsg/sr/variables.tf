variable "name" {
  description = "The name of the security rule. This needs to be unique across all Rules in the Network Security Group"
  type        = string
}

variable "description" {
  description = "A description for this rule. Restricted to 140 characters"
  type        = string
  default     = ""
}

variable "rg_name" {
  description = "The name of the resource group in which to create the Network Security Rule"
  type        = string
}

variable "nsg_name" {
  description = "The name of the Network Security Group that we want to attach the rule to"
  type        = string
}

variable "priority" {
  description = "Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule"
  type        = number
}

variable "direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound"
  type        = string
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny"
  type        = string
}

variable "protocol" {
  description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, or * (which matches all)"
  type        = string
}

variable "source_port_range" {
  description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified"
  type        = string
  default     = null
}

variable "source_port_ranges" {
  description = "List of source ports or port ranges. This is required if source_port_range is not specified"
  type        = list(string)
  default     = null
}

variable "destination_port_range" {
  description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified"
  type        = string
  default     = null
}

variable "destination_port_ranges" {
  description = "List of destination ports or port ranges. This is required if destination_port_range is not specified"
  type        = list(string)
  default     = null
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified"
  type        = string
  default     = null
}

variable "source_address_prefixes" {
  description = "List of source address prefixes. Tags may not be used. This is required if source_address_prefix is not specified"
  type        = list(string)
  default     = null
}

variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified"
  type        = string
  default     = null
}

variable "destination_address_prefixes" {
  description = "List of destination address prefixes. Tags may not be used. This is required if destination_address_prefix is not specified"
  type        = list(string)
  default     = null
}