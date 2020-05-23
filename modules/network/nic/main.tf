resource "azurerm_network_interface" "nic" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location

  ip_configuration {
    name                          = var.ipc_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation
    private_ip_address            = var.private_ip
    public_ip_address_id          = var.pip_id
  }

  tags = var.tags
}