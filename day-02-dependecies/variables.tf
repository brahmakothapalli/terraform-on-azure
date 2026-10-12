variable "rg_name" {
  description = "The name of the resource group"
  type        = string  
}

variable "rg_location" {
  description = "The location of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}
