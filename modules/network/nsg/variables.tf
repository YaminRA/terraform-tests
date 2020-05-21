variable "rg_name" {
  description = "Resource Group where NSG will be deployed"
  type        = string
}

variable "location" {
  description = "Location where NSG will be deployed"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type        = map(string)
  default     = {}
}