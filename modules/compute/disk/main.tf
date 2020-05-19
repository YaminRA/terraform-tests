locals {
  disk_name = "${var.rg_name}-${var.disk_prefix}-datadisk"
}

resource "azurerm_managed_disk" "disk" {
  resource_group_name = var.rg_name
  name                = local.disk_name
  location            = var.location
  storage_account_type = var.sa_type
  create_option        = var.create_option
  disk_size_gb         = var.size
}