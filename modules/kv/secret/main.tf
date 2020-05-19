provider "random" {
  version = ">= 2.2.1"
}

resource "random_password" "secret" {
  length = 16
  upper = true
  min_upper = 4
  lower = true
  min_lower = 4
  number = true
  min_numeric = 4
  special = true
  min_special = 4
  override_special = "@#$%^*()-=_+[]{};<>?,./"
}

resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = var.kv_id
  name         = var.secret_name
  value        = random_password.secret.result
  tags = var.tags
}