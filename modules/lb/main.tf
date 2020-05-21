locals {
  lb_name     = "${var.rg_name}-lb"
  fe_ipc_name = "${local.lb_name}-ip"
}

resource "azurerm_lb" "lb" {
  resource_group_name = var.rg_name
  name                = local.lb_name
  location            = var.location
  tags                = var.tags

  frontend_ip_configuration {
    name                          = local.fe_ipc_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_address_allocation
    private_ip_address            = var.ip_address
  }
}