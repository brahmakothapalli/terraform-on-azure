provider azurerm {
  features {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
  resource_provider_registrations = "none"  
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 5.7.0"
    }
  }
}

data azurerm_resource_group "rg" {
  name = "kml_rg_main"
}

resource azurerm_storage_account "sa" {
  name                     = "backendstatesa"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  #change after resource creation for testing state refresh
  public_network_access_enabled = false
}