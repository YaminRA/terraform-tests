terraform {
  required_providers {
    azurerm = "~> 2.9.0"
    random  = "~> 2.2.1"
    null    = "~> 2.1.2"
  }
}

# Establish connection to Azure through Service Principal
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

data "azurerm_client_config" "current" {
}