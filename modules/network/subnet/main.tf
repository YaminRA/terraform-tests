locals {
  subnet_name = "${var.subnet_name}-${var.subnet_pool}-subnet"
}

resource "azurerm_subnet" "subnet" {
  resource_group_name = var.rg_name
  virtual_network_name = var.vnet_name
  name                = local.subnet_name
  address_prefixes     = var.subnet_cidr
}