locals {
  rg_name = "${var.location}-${var.infrastructure}-${var.environment}-${var.service}"
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}