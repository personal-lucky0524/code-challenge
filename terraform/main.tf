module "resource-group" {
  source                      = "./modules/resource-group"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  Environment                 = var.Environment
  Created_By                  = var.Created_By
}

module "vnet" {
  source                      = "./modules/vnet"
  vnet_name                   = var.vnet_name
  location                    = module.resource-group.location
  resource_group_name         = module.resource-group.resource_group_name
  address_space               = var.network_address_space
  address_prefixes            = var.aks_subnet_prefixes
  subnet_name                 = var.aks_subnet_name
  Environment                 = var.Environment
  Created_By                  = var.Created_By

  depends_on = [
    module.resource-group
  ]
}

module "acr" {
  source                           = "./modules/acr"
  acr_name                         = var.acr_name
  Environment                      = var.Environment
  Created_By                       = var.Created_By

  depends_on = [
    module.resource-group
  ]
}

module "aks" {
  source                           = "./modules/aks"
  resource_group_name              = module.resource-group.resource_group_name
  location                         = module.resource-group.location
  kubernetes_version               = var.kubernetes_version
  dns_prefix                       = var.dns_prefix
  cluster_name                     = var.cluster-name
  network_plugin                   = "azure"
  vnet_subnet_id                   = module.vnet.subnet_id
  subnet_name                      = module.vnet.subnet_name
  os_disk_size_gb                  = 30
  private_cluster_enabled          = false # default value
  enable_http_application_routing  = false
  enable_auto_scaling              = true
  Environment                      = var.Environment
  Created_By                       = var.Created_By
  log_analytics_workspace_id       = module.log-analytics.id
  
  addons = {
    oms_agent                   = true
    azure_policy                = false
    ingress_application_gateway = true
  }

  depends_on = [
    module.resource-group,
    module.vnet,
    module.acr,
    module.log-analytics
  ]
}

module "log-analytics" {
  source                          = "./modules/log-analytics"
  log_analytics_workspace_name    = var.log_analytics_workspace_name
  location                        = module.resource-group.location
  resource_group_name             = module.resource-group.resource_group_name
  log_analytics_workspace_sku     = var.log_analytics_workspace_sku
  log_retention_in_days           = var.log_retention_in_days   
  Environment                     = var.Environment  
  Created_By                      = var.Created_By 

  depends_on = [
    module.resource-group
  ]
}