variable "rg_name" {
  description = "Resource Group where Availability Set will be deployed"
  type        = string
}

variable "location" {
  description = "Location where the Key Vault will be deployed"
  type        = string
}

variable "kv_sku" {
  description = "Key Vault SKU to be created"
  type        = string
  default = "standard"
}

variable "kv_name" {
  description = "Name of Key Vault to be created"
  type        = string
}

variable "kv_ap_key_permissions" {
  description = "List of key permissions"
  type = list(string)
  default = []
}

variable "kv_ap_secret_permissions" {
  description = "List of secret permissions"
  type = list(string)
  default = []
}

variable "kv_ap_certificate_permissions" {
  description = "List of certificate permissions"
  type = list(string)
  default = []
}

variable "kv_ap_storage_permissions" {
  description = "List of storage permissions"
  type = list(string)
  default = []
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type = map(string)
  default = {}
}