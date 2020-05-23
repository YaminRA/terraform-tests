resource "azurerm_network_interface_backend_address_pool_association" "bap_as" {
  ip_configuration_name   = var.ipc_name
  network_interface_id    = var.nic_id
  backend_address_pool_id = var.bap_id
}