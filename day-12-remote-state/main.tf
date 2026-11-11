provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "00000000-0000-0000-0000-000000000000"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 5.7.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "kml_rg_main"
    storage_account_name = "backendstatesa"
    container_name       = "statecontainer"
    key                  = "remoteterraformstate.tfstate"
    subscription_id      = "00000000-0000-0000-0000-000000000000"
  }
}

data "azurerm_resource_group" "rg" {
  name = "kml_rg_main-95715a58a47d4655"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "kml_vnet_main"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_storage_account" "sa" {
  name                          = "testsa3212b28c8519489"
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false
}