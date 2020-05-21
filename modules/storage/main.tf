# Generate random text for a unique storage account name
resource "random_id" "rdm_id" {
  byte_length = 8
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "%{if length(var.sa_name) > 8}${substr(var.sa_name, 0, 8)}%{else}${var.sa_name}%{endif}${random_id.rdm_id.hex}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication
  tags                     = var.tags
}