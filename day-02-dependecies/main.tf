data "azurerm_resource_group" "rg" {
  name     = var.rg_name
#   location = var.rg_location

#   tags = {
#     environment = "testing"
#   }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name #implicit dependency
  location            = var.rg_location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name #implicit dependency
  virtual_network_name = azurerm_virtual_network.vnet.name #implicit dependency
  address_prefixes     = ["10.0.2.0/24"] 
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = data.azurerm_resource_group.rg.name #implicit dependency

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet.id #implicit dependency
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.public_ip.id #implicit dependency
#   }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id #implicit dependency
  network_security_group_id = azurerm_network_security_group.nsg.id #implicit dependency

  depends_on = [ #explicit dependency to avoid race condition, wait for both resourcesfully ready before creating the association
    azurerm_subnet.subnet,
    azurerm_network_security_group.nsg
  ]
}