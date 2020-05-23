# Generate random text for a unique storage account name
locals {
  sa_name = "${var.name}${random_id.rdm_id.hex}"
}

resource "random_id" "rdm_id" {
  byte_length = 8
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "%{if length(local.sa_name) > 24}${substr(local.sa_name, 0, 24)}%{else}${local.sa_name}%{endif}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication
  tags                     = var.tags
}