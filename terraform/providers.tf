terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.95.0"
    }
  }
  backend "azurerm" {
    storage_account_name        = ""
    resource_group_name         = ""
    container_name              = ""
    key                         = ""
    access_key                  = ""
  }
}

provider "azurerm" {
    features {}
}