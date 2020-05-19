locals {
  avs_name = "${var.rg_name}-avs"
}

resource "azurerm_availability_set" "avs" {
  resource_group_name = var.rg_name
  name                = local.avs_name
  location            = var.location
  platform_fault_domain_count = var.avs_fd
  platform_update_domain_count = var.avs_ud
  tags = var.tags
}