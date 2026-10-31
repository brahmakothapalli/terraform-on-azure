# resource definitions

data azurerm_resource_group rg {
  name     = var.resource_group_name
#   location = var.resource_group_location
}

resource "azurerm_storage_account" "sa" {
#   name                     = "kmlsa1" # giving name of the existing storage account name, terraform apply will fail as the storage account already exists, so we will use target resource feature to create a new storage account with unique name
  name                     = "kmlsa546541" # later provide unique name for the storage account using target resource feature  
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}