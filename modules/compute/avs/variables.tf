variable "rg_name" {
  description = "Resource Group where Availability Set will be deployed"
  type        = string
}

variable "location" {
  description = "Location where the Availability Set will be deployed"
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
  description = "Enter Tags to identify deployed resources"
  type        = map(string)
  default     = {}
}