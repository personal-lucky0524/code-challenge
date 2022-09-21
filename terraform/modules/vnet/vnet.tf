resource "azurerm_virtual_network" "vnet" {
  name                      = var.vnet_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  address_space             = var.address_space

  tags = {
    Environment = var.Environment
    Created_By  = var.Created_By
  }
}

resource "azurerm_subnet" "subnet_aks" {
    name                    = var.subnet_name
    resource_group_name     = azurerm_virtual_network.vnet.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    address_prefixes        = var.address_prefixes
}
