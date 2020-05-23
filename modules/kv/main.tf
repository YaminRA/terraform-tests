resource "azurerm_key_vault" "kv" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  tenant_id           = var.tenant_id
  sku_name            = var.sku
  tags                = var.tags
}