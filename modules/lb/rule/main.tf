resource "azurerm_lb_rule" "rule" {
  name                           = var.name
  resource_group_name            = var.rg_name
  loadbalancer_id                = var.lb_id
  frontend_ip_configuration_name = var.fe_ipc_name
  protocol                       = var.protocol
  frontend_port                  = var.fe_port
  backend_port                   = var.be_port
  backend_address_pool_id        = var.lb_bap_id
  probe_id                       = var.lb_pb_id
}