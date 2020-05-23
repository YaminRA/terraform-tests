resource "azurerm_managed_disk" "disk" {
  name                 = var.name
  resource_group_name  = var.rg_name
  location             = var.location
  storage_account_type = var.sa_type
  create_option        = var.create_option
  disk_size_gb         = var.size
}