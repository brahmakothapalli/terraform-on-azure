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
    #existing storage account name
    storage_account_name = "backendstatesa"
    container_name       = "statecontainer"
    key                  = "remoteterraformstate.tfstate"
    subscription_id      = "00000000-0000-0000-0000-000000000000"
  }
}

# existing resource group
data "azurerm_resource_group" "rg" {
  name = "kml_rg_main-95715a58a47d4655"
}

# existing storage account
data "azurerm_storage_account" "sa" {
  name                = "testsa3212b28c8519489"
  resource_group_name = data.azurerm_resource_group.rg.name
}

# creating storage container in existing storage account
resource "azurerm_storage_container" "sa_container" {
  name                  = "filesacontainer"
#   storage_account_name  = data.azurerm_storage_account.sa.name
  storage_account_id    = data.azurerm_storage_account.sa.id
  container_access_type = "private"
}

# Creating a new storage account in the existing resource group
resource "azurerm_storage_account" "sa" {
  name                          = "sampleaccount12345"
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false
}