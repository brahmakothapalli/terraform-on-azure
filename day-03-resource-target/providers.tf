# providers required for resource creation/deletion/updation

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 5.7.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
#   client_id = "your-client-id"
#   client_secret = "your-client-secret"
#   subscription_id = "your-subscription-id"
#   tenant_id = "your-tenant-id"
}