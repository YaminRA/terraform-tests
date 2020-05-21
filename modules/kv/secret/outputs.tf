output "value" {
  value     = azurerm_key_vault_secret.secret.value
  sensitive = true
}