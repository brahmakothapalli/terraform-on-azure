output "resource_group_id" {
  value = azurerm_resource_group.resource_group.id
}

output "resource_group_location" {
  value = azurerm_resource_group.resource_group.location
}

output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "resource_group_tags" {
  value = azurerm_resource_group.resource_group.tags
}

output "resource_group_provisioning_state" {
  value = azurerm_resource_group.resource_group.provisioning_state
}
