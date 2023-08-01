output "name" {
  description = "The name of the private dns zone."
  value       = azurerm_private_dns_zone.dns_zone.name
}

output "id" {
  description = "The id of the private dns zone."
  value       = azurerm_private_dns_zone.dns_zone.id
}

output "object" {
  description = "The private dns zone object."
  value       = azurerm_private_dns_zone.dns_zone
}