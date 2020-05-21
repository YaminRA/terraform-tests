variable "location" {
  description = "Region where resource will be deployed"
  type        = string
}

variable "infrastructure" {
  description = "Name of the app to be deployed"
  type        = string
}

variable "environment" {
  description = "Environment where resource will be deployed"
  type        = string
}

variable "service" {
  description = "Service that will be deployed"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type        = map(string)
  default     = {}
}