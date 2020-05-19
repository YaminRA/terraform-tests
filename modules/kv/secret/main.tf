resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = var.kv_id
  name         = var.secret_name
  value        = var.secret_value
  tags = var.tags
}