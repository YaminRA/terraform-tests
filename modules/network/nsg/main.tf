resource "azurerm_network_security_group" "nsg" {
  resource_group_name = var.rg_name
  name                = var.name
  location            = var.location
  tags                = var.tags
}