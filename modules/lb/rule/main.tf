locals {
  rule_name = "${var.lb_name}-rule"
}

resource "azurerm_lb_rule" "rule" {
  resource_group_name = var.rg_name
  name                = local.rule_name
  loadbalancer_id     = var.lb_id
  protocol                       = var.protocol
  frontend_port                  = var.fe_port
  backend_port                   = var.be_port
  frontend_ip_configuration_name = var.fe_ipc_name
  backend_address_pool_id = var.lb_bap_id
  probe_id = var.lb_probe_id
}