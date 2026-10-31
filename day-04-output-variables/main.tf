data azurerm_resource_group "rg" {
  name = var.resource_group_name
}

resource azurerm_public_ip "pip" {
  name                = "kml_pip_1"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}