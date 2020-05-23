variable "name" {
  description = "The Name which should be used for this Resource Group"
  type        = string
}

variable "location" {
  description = "Region where resource will be deployed"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type        = map(string)
  default     = {}
}