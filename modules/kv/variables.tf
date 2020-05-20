variable "rg_name" {
  description = "Resource Group where Availability Set will be deployed"
  type        = string
}

variable "location" {
  description = "Location where the Key Vault will be deployed"
  type        = string
}

variable "kv_name" {
  description = "Specifies the name of the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault"
  type        = string
}

variable "kv_sku" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type = map(string)
  default = {}
}