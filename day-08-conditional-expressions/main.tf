provider "azurerm" {
    features {}
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

variable "environment" {
    type = string
    default = "dev"
}

locals {
    location = var.environment == "prod" ? "eastus" : "westus"
    name = "rg-${var.environment}"
    environments = ["dev", "test", "prod"]
    apps = ["web", "api", "db"]
    ressource_group_names = [for env in local.environments : [for app in local.apps: "rg-${env}-${app}"]]

}

resource azurerm_resource_group "rg" {
  for_each = toset(flatten(local.ressource_group_names))
  name     = each.value
  location = local.location
}