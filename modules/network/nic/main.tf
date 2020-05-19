locals {
  nic_name = "${var.rg_name}-${var.nic_prefix}-nic"
}

resource "azurerm_network_interface" "nic" {
  resource_group_name = var.rg_name
  name                = local.nic_name
  location            = var.location

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.nic_ipconfig
    private_ip_address = var.nic_ip
  }

  tags = var.tags
}