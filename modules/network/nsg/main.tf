locals {
  nsg_name = "${var.rg_name}-nsg"
}

resource "azurerm_network_security_group" "nsg" {
  resource_group_name = var.rg_name
  name                = local.nsg_name
  location            = var.location
  tags = var.tags
}