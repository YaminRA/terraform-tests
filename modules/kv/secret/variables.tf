variable "kv_id" {
  description = "Key Vault ID where Secret will be created"
  type        = string
}

variable "secret_name" {
  description = "Name of Secret to be created"
  type        = string
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type = map(string)
  default = {}
}