resource "azurerm_lb_backend_address_pool" "bap" {
  name                = var.name
  resource_group_name = var.rg_name
  loadbalancer_id     = var.lb_id
}