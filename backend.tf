terraform {
  required_providers {
    azurerm = "~> 2.10.0"
    random  = "~> 2.2.1"
    null    = "~> 2.1.2"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {
}