## Azure

Note that you cannot create new resource groups in the playground. All resources must be deployed to the provided resource group.

1. Collect the `Application Client ID` and `Client Secret` from the playground start page
1. From the console home page, go to `Resource Groups`. Copy the resource group name (which usually starts with `kml_rg_main_`)
1. Go to `Resource Manager` -> `Management Groups` in the console and collect the values for `Management Group` and `Subscription`
1. Export these values as environment variables in your laptop's shell

    **Linux/macOS**

    ```bash
    export ARM_CLIENT_ID="replace-with-client-id"
    export ARM_CLIENT_SECRET="replace-with-client-secret"
    export ARM_TENANT_ID="replace-with-management-group-id"
    export ARM_SUBSCRIPTION_ID="replace-with-subscription"
    export RESOURCE_GROUP_NAME="replace-with-resource-group"
    export TF_VAR_resource_group_name="replace-with-resource-group"
    ```

    **Windows PowerShell**

    ```powershell
    $env:ARM_CLIENT_ID="replace-with-client-id"
    $env:ARM_CLIENT_SECRET="replace-with-client-secret"
    $env:ARM_TENANT_ID="replace-with-management-group-id"
    $env:ARM_SUBSCRIPTION_ID="replace-with-subscription"
    $env:RESOURCE_GROUP_NAME="replace-with-resource-group"
    $env:TF_VAR_resource_group_name="replace-with-resource-group"
    ```

The terraform Azure provider will pick up the `ARM_` variables automatically.

Set up the terraform provider like this

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.1"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}

# We make this a var since each time you start a playground, it will be different.
# It will automatically be filled from the TF_VAR_resource_group_name environment variable.
variable "resource_group_name" {
  description = "Name of the existing Azure resource group"
  type        = string
}

# Use this resource to provide resource group to all resources that require one (i.e. most of them).
# By declaring this data source instead of providing the RG name as a string to other resources, it
# makes your plan fail fast if the RG name is wrong - which is a good thing!
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}