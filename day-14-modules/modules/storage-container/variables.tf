variable "storage_container_name" {
  description = "Name of the storage container"
  type        = string
}

variable "storage_account_id" {
  description = "ID of the storage account"
  type        = string
}

variable "container_access_type" {
  description = "Access type of the storage container"
  type        = string
  default     = "private"
}