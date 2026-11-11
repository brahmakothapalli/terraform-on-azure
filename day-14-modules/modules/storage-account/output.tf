output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}