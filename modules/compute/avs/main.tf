resource "azurerm_availability_set" "avs" {
  name                         = var.name
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_fault_domain_count  = var.avs_fd
  platform_update_domain_count = var.avs_ud
  tags                         = var.tags
}