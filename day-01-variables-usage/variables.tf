variable "rg_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "rg_name" {
  type        = string
  default     = "kml_rg_main"
  description = "Resource group name in your Azure subscription."
}

variable "vnet_name" {
  type        = string
  default     = "kml_vnet_1"
  description = "Virtual network name in your Azure subscription."
}

variable "subnet_name" {
  type        = string
  default     = "kml_subnet_1"
  description = "Subnet name in your Azure subscription."
}

