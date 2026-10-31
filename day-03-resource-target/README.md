# Day 03 - Terraform Resource Target

This module demonstrates Terraform's `-target` feature, which lets you apply, destroy, or plan only a specific resource or resource set instead of the entire configuration.

## Why this feature is useful

In real-world Terraform projects, you may work with:

- a large environment with many resources
- an existing shared resource group
- a resource that must be created independently for testing or debugging
- a situation where you want to avoid updating unrelated infrastructure

Using `-target` helps you focus on the exact resource you want to manage.

## What this example does

This configuration:

- reads an existing Azure Resource Group using `data "azurerm_resource_group"`
- creates a new Azure Storage Account in that resource group

The storage account name is intentionally set as a unique value so it can be created independently when needed. This is helpful because Azure Storage Account names must be globally unique.

## Example workflow

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```

3. Apply only the storage account resource:
   ```bash
   terraform apply -target="azurerm_storage_account.sa"
   ```

4. Destroy only that resource if needed:
   ```bash
   terraform destroy -target="azurerm_storage_account.sa"
   ```

## Example use case

If a resource already exists and you want to create a new resource without affecting the rest of the stack, `-target` lets you isolate the resource and handle it safely.

This pattern is helpful for learning, troubleshooting, and controlled incremental deployment workflows.
