resource "azurerm_key_vault_access_policy" "access_policy" {
  key_vault_id            = var.kv_id
  tenant_id               = var.tenant_id
  object_id               = var.object_id
  key_permissions         = var.kp
  secret_permissions      = var.sp
  certificate_permissions = var.cp
  storage_permissions     = var.sgp
}