# Day 04 - Terraform Output Variables

This module demonstrates Terraform output values with Azure. It looks up the
existing resource group named by `resource_group_name`, then creates a Standard
SKU static public IP address in that group.

## How the output works

`output.tf` defines `public_ip_address` using the created resource's
`ip_address` attribute. Terraform evaluates this value after the public IP is
created and displays it at the end of `terraform apply`. You can also retrieve
it later with:

```bash
terraform output public_ip_address
```

Outputs are useful for displaying resource values and passing them from a child
module to its parent. Unlike input variables, which provide values to a
configuration, outputs expose values produced by it.
