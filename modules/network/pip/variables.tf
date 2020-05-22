variable "name" {
  description = "Specifies the name of the Public IP resource"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the public ip"
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  type        = string
  default     = "Dynamic"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}