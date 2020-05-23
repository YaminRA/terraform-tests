variable "name" {
  description = "Specifies the name of the Key Vault"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group in which to create the Key Vault"
  type        = string
}

variable "location" {
  description = "Location where the Key Vault will be deployed"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault"
  type        = string
}

variable "sku" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type        = map(string)
  default     = {}
}