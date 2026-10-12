# Variables Usage

This module declares resource group, location, virtual network, and subnet names as input variables in `variables.tf`.
`main.tf` references these variables to look up the resource group and configure the virtual network and subnet.
Each variable has a default value, which can be overridden when running Terraform.
