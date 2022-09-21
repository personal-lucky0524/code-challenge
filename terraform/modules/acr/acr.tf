data "azurerm_resource_group" "rg" {
  name = "demo-env-rg"
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.acr_name}acr"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true

  tags = {
    "Environment"         = var.Environment
    "Created By"          = var.Created_By
  }
}