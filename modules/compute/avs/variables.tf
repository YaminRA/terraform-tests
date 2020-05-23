variable "name" {
  description = "Specifies the name of the availability set"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the availability set"
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  type        = string
}

variable "avs_fd" {
  description = "Specifies the number of fault domains that are used"
  type        = number
  default     = 1
}

variable "avs_ud" {
  description = "Specifies the number of update domains that are used"
  type        = number
  default     = 1
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}