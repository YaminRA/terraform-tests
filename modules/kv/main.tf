locals {
  kv_name = "${var.kv_name}-kv"
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "kv" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = local.kv_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name = var.kv_sku

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = var.kv_ap_key_permissions
    secret_permissions = var.kv_ap_secret_permissions
    certificate_permissions = var.kv_ap_certificate_permissions
    storage_permissions = var.kv_ap_storage_permissions
  }

  tags = var.tags
}