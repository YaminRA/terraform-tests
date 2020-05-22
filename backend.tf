terraform {
  required_providers {
    azurerm = "~> 2.10.0"
    random  = "~> 2.2.1"
    null    = "~> 2.1.2"
  }

  /*backend "azurerm" {
    resource_group_name  = "UKSOUTH-NRFLIFT-PRD-RGP-NETWORK"
    storage_account_name = "solrtstate20200520221645"
    container_name       = "solrtstate"
    key                  = "solr.terraform.tfstate"
  }*/
}

# Establish connection to Azure through Service Principal
provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {
}
