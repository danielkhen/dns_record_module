<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | (Optional) The a records to add to the private dns zone. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | (Optional) The aaaa records to add to the private dns zone. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the private dns record. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group of the dns zone. | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | (Optional) A list of virtual networks to link with the dns zone, only needed when dns zone is private. | <pre>list(object({<br>    vnet_id = string<br>    name    = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The id of the private dns zone. |
| <a name="output_name"></a> [name](#output\_name) | The name of the private dns zone. |
| <a name="output_object"></a> [object](#output\_object) | The private dns zone object. |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_a_record.records](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_aaaa_record.records](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_aaaa_record) | resource |
| [azurerm_private_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.vnet_links](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Example Code

```hcl
module "dns_record" {
  source = "github.com/danielkhen/dns_record_module"

  name                = "example-name"
  resource_group_name = azurerm_resource_group.example.name
  dns_name            = "example-dns.com"
  a_records           = ["10.0.0.10"]
  vnet_links = [ # Links to vnets in the case of a private dns.
    {
      name    = "example-link"
      vnet_id = azurerm_virtual_network.example.id
    }
  ]
}
```
<!-- END_TF_DOCS -->