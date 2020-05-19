locals {
  bap_name = "${var.lb_name}-bap"
}

resource "azurerm_lb_backend_address_pool" "bap" {
  resource_group_name = var.rg_name
  name                = local.bap_name
  loadbalancer_id     = var.lb_id
}