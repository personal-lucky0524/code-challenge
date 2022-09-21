resource "azurerm_resource_group" "main" {
    name                    = var.resource_group_name
    location                = var.location
    tags = {
      Environment           = var.Environment
      Created_By            = var.Created_By
    }
}