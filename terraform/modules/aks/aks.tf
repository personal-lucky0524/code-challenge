data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "non-prod" {
}

data "azurerm_key_vault" "keyvault" {
  name                      = "code-challenge-kv"
  resource_group_name       = "demo-env-rg"
}

data "azurerm_key_vault_secret" "client-id" {
  name                      = "client-id"
  key_vault_id              = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "client-secret" {
  name                      = "client-secret"
  key_vault_id              = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "ssh-key" {
  name                      = "ssh-key"
  key_vault_id              = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "admin_group_object_ids" {
  name                      = "aks-admin-group"
  key_vault_id              = data.azurerm_key_vault.keyvault.id
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.cluster_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  dns_prefix                = var.dns_prefix
  private_cluster_enabled   = var.private_cluster_enabled
  kubernetes_version        = var.kubernetes_version

    tags = {
      "Environment"         = var.Environment
      "Created By"          = var.Created_By
    }

    linux_profile {
      admin_username        = var.admin_username
      ssh_key {
        key_data            = data.azurerm_key_vault_secret.ssh-key.value
      }
    }

    default_node_pool {
      name                  = "aksnodepool"
      type                  = var.node_type
      node_count            = var.initial_node_count
      vm_size               = var.node_size
      os_disk_size_gb       = var.os_disk_size_gb
      vnet_subnet_id        = var.vnet_subnet_id
      enable_auto_scaling   = var.enable_auto_scaling
      min_count             = var.node_min_count
      max_count             = var.node_max_count
      max_pods              = var.max_pods

    tags = {
      "Environment"         = var.Environment
      "Created By"          = var.Created_By
    }
    }

    lifecycle {
    ignore_changes = [default_node_pool[0].node_count,
      default_node_pool[0].min_count,
      default_node_pool[0].max_count,
      addon_profile
    ]
    }
    
    service_principal {
        client_id     = data.azurerm_key_vault_secret.client-id.value
        client_secret = data.azurerm_key_vault_secret.client-secret.value
    }

    addon_profile {
    http_application_routing {
      enabled = var.enable_http_application_routing
    }

    oms_agent {
      enabled                    = var.addons.oms_agent
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }

    azure_policy {
      enabled = var.addons.azure_policy
    }

    aci_connector_linux {
      enabled     = var.enabled_aci_connector_linux
      subnet_name = var.subnet_name
    }
    }

    network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    outbound_type      = var.outbound_type
    load_balancer_sku = var.load_balancer_sku
    }

    role_based_access_control {
    enabled = var.role_based_access_control
    azure_active_directory {
      managed                = var.azure_active_directory_enabled
      admin_group_object_ids = [data.azurerm_key_vault_secret.admin_group_object_ids.value]
    }
    }
}

data "azurerm_resource_group" "node_resource_group" {
  name = azurerm_kubernetes_cluster.aks.node_resource_group
         depends_on = [
     azurerm_kubernetes_cluster.aks
  ]
}