variable "environment" {
    type = string
    default = "dev"  
}

locals {
    name = "rg-${var.environment}"
    location = var.environment == "prod" ? "eastus" : "westus"
}

resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = local.location
}