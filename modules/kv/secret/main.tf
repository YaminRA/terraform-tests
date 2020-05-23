resource "random_password" "secret" {
  length           = var.secret_length
  min_upper        = var.min_upper
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
  override_special = var.allowed_special_chars
}

resource "azurerm_key_vault_secret" "secret" {
  name         = var.name
  key_vault_id = var.kv_id
  value        = random_password.secret.result
  content_type = var.content
  tags         = var.tags
}