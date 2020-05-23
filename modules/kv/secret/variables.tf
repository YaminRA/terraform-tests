variable "name" {
  description = "Specifies the name of the Key Vault Secret"
  type        = string
}

variable "kv_id" {
  description = "The ID of the Key Vault where the Secret should be created"
  type        = string
}

variable "content" {
  description = "Specifies the content type for the Key Vault Secret"
  type        = string
}

variable "secret_length" {
  description = "The length of the string desired"
  type        = number
}

variable "min_upper" {
  description = "Minimum number of uppercase alphabet characters in random string"
  type        = number
}

variable "min_lower" {
  description = "Minimum number of lowercase alphabet characters in random string"
  type        = number
}

variable "min_numeric" {
  description = "Minimum number of numeric characters in random string"
  type        = number
}

variable "min_special" {
  description = "Minimum number of special characters in random string"
  type        = number
}

variable "allowed_special_chars" {
  description = "Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument. The special argument must still be set to true for any overwritten characters to be used in generation"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}