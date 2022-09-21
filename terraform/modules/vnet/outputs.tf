output "subnet_name" {
  description = "The name of the subnet created"
  value       = azurerm_subnet.subnet_aks.name
}
output "subnet_id" {
  description = "The id of the subnet created"
  value       = azurerm_subnet.subnet_aks.id
}
output "address_prefixes" {
  description = "value of the subnet prefix"
  value       = azurerm_subnet.subnet_aks.address_prefixes
}
output "vnet_id" {
  description = "The id of the vnet created"
  value       = azurerm_virtual_network.vnet.id
}
output "vnet_name" {
  description = "The name of the vnet created"
  value       = azurerm_virtual_network.vnet.name
}
output "vnet_address_space" {
  description = "The address space of the vnet created"
  value       = azurerm_virtual_network.vnet.address_space
}
