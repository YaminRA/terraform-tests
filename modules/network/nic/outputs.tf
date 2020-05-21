output "id" {
  value = azurerm_network_interface.nic.id
}

output "ip_name" {
  value = azurerm_network_interface.nic.ip_configuration[0].name
}