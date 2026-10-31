provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

variable "environments" {
  type    = list(string)
  default = ["dev", "test", "prod"]
}

locals { 
  # when using a for expression, the result is a map with the key being the value of the variable and the value being the resource group name
  resource_groups_names = { for env in var.environments : env => "rg-${env}" }
}

resource "azurerm_resource_group" "rg" {
  for_each = local.resource_groups_names
  name     = each.value
  location = "East US"
}