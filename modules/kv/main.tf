locals {
  kv_name = "${var.kv_name}-kv"
}

resource "azurerm_key_vault" "kv" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = local.kv_name
  tenant_id           = var.tenant_id
  sku_name            = var.kv_sku
  tags                = var.tags
}