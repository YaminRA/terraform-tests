resource "azurerm_lb" "lb" {
  resource_group_name = var.rg_name
  name                = var.name
  location            = var.location
  sku                 = var.sku
  tags                = var.tags

  frontend_ip_configuration {
    name                          = var.fe_ipc_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation
    private_ip_address            = var.private_ip
  }
}