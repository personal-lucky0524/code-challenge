resource_group_name         = "code-challenge-rg"
location                    = "southindia"
Environment                 = "Demo"
Created_By                  = "Chandra"

/* Vnet values: */
vnet_name                   = "code-challenge-vnet"
aks_subnet_name             = "aks-subnet"
network_address_space       = ["172.16.0.0/16"]
aks_subnet_prefixes         = ["172.16.0.0/24"]

/* Kubernetes values */
kubernetes_version          = "1.23.5"
cluster-name                = "code-challenge-aks"
dns_prefix                  = "code-challenge"

/* Acr */
acr_name                    = "demoenvchnacr"

# log analytics
log_retention_in_days       = "30"
log_analytics_workspace_name= "code-challenge"
log_analytics_workspace_sku = "PerGB2018"

