provider "azurerm" {
    features {}
    resource_provider_registrations = "none"  
}

variable "ports" {
    type = list(number)
    default = [22, 80, 443]
}

data "azurerm_resource_group" "rg" {
  name = "test-rg"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "test-sg"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.ports
    content {
      name                        = "allow-port-${security_rule.value}"
      priority                    = 1000 + security_rule.key
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = security_rule.value
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    }
    
  }
}

# defining the nsg rules as separate resources
# resource "azurerm_network_security_rule" "nsg_rule" {
#   name                        = "test-rule"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "22"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = data.azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "nsg_rule2" {
#   name                        = "test-rule2"
#   priority                    = 200
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "80"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = data.azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "nsg_rule3" {
#   name                        = "test-rule3"
#   priority                    = 300
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "443"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = data.azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# } 