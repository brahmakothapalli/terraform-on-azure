variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "account_replication_type" {
  type        = string
  description = "Replication type for the storage account"
}

variable "account_tier" {
  type        = string
  description = "Tier for the storage account"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the storage container"
}

variable "container_access_type" {
  type        = string
  description = "Access type of the storage container"
}