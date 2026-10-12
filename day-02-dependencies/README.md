# Day 02: Dependencies

1. Looks up an existing Azure resource group using `rg_name`; it does not create the resource group.
2. Uses `terraform.tfvars` to provide the required resource group name and location, virtual network name, subnet name, and network security group name.
3. Creates a virtual network, subnet, and network security group; the address ranges are currently defined in `main.tf`.
4. Associates the subnet with the network security group, using resource references for implicit dependencies and `depends_on` for an explicit dependency.
