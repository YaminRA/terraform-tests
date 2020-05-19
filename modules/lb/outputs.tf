output "id" {
    value = azurerm_lb.lb.id
}

output "name" {
    value = azurerm_lb.lb.name
}

output "fe_ipc_name" {
    value = azurerm_lb.lb.frontend_ip_configuration[0].name
}