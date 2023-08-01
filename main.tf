resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group_name

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  vnet_links_map = { for link in var.vnet_links : link.name => link }
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_links" {
  for_each = local.vnet_links_map

  name                  = each.value.name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = each.value.vnet_id

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  a_records_map = { for record in var.a_records : record.name => record }
}

resource "azurerm_private_dns_a_record" "records" {
  for_each = local.a_records_map

  name                = each.value.name
  resource_group_name = var.resource_group_name
  zone_name           = azurerm_private_dns_zone.dns_zone.name
  ttl                 = each.value.ttl
  records             = each.value.records

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  aaaa_records_map = { for record in var.aaaa_records : record.name => record }
}

resource "azurerm_private_dns_aaaa_record" "records" {
  for_each = local.a_records_map

  name                = each.value.name
  resource_group_name = var.resource_group_name
  zone_name           = azurerm_private_dns_zone.dns_zone.name
  ttl                 = each.value.ttl
  records             = each.value.records

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}