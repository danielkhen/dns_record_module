locals {
  location            = "westeurope"
  resource_group_name = "dtf-dns-record-test"
}

resource "azurerm_resource_group" "test_rg" {
  name     = local.resource_group_name
  location = local.location

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  public_ip_name              = "public_ip"
  public_ip_allocation_method = "Static"
}

resource "azurerm_public_ip" "test_ip" {
  name                = local.public_ip_allocation_method
  location            = local.location
  resource_group_name = azurerm_resource_group.test_rg.name
  allocation_method   = local.public_ip_allocation_method

  lifecycle {
    ignore_changes = [tags["CreationDateTime"], tags["Environment"]]
  }
}

locals {
  dns_name = "dns-record.com"
  dns_a_records = [{
    name    = "test"
    ttl     = 300
    records = ["10.0.0.10", "172.0.0.172"]
  }]
}

module "private_dns_zone" {
  source = "../"

  name                = local.dns_name
  resource_group_name = azurerm_resource_group.test_rg.name
  a_records           = local.dns_a_records
}