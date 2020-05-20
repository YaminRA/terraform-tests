variable "kv_id" {
  description = "Specifies the id of the Key Vault resource"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault"
  type        = string
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies"
  type        = string
}

variable "kp" {
  description = "List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey"
  type = list(string)
  default = []
}

variable "sp" {
  description = "List of secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  type = list(string)
  default = []
}

variable "cp" {
  description = "List of certificate permissions, must be one or more from the following: backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update"
  type = list(string)
  default = []
}

variable "sgp" {
  description = "List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update"
  type = list(string)
  default = []
}

variable "tags" {
  description = "Enter Tags to identify deployed resources"
  type = map(string)
  default = {}
}