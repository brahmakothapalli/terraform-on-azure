data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "storage_account" {
  source                   = "./modules/storage-account"
  storage_account_name     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.resource_group.name
  location                 = data.azurerm_resource_group.resource_group.location
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
}

module "storage_container" {
  source                 = "./modules/storage-container"
  storage_account_id     = module.storage_account.storage_account_id
  storage_container_name = var.storage_container_name
  container_access_type  = var.container_access_type
}