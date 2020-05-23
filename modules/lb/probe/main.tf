resource "azurerm_lb_probe" "probe" {
  name                = var.name
  resource_group_name = var.rg_name
  loadbalancer_id     = var.lb_id
  protocol            = var.protocol
  port                = var.port
}