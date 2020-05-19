locals {
  probe_name = "${var.lb_name}-pb"
}

resource "azurerm_lb_probe" "probe" {
  resource_group_name = var.rg_name
  name                = local.probe_name
  loadbalancer_id     = var.lb_id
  port                = var.port
}