output "client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_key
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.cluster_ca_certificate
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.host
}

output "username" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.username
}

output "password" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config.0.password
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "location" {
  value = azurerm_kubernetes_cluster.aks.location
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "client_id" {
  value = data.azurerm_key_vault_secret.client-id.value
}

output "client_secret" {
  value = data.azurerm_key_vault_secret.client-secret.value
  sensitive = true
}

output "ssh-key" {
  value = data.azurerm_key_vault_secret.ssh-key.value
  sensitive = true
}

output "key_vault_id" {
  value = data.azurerm_key_vault.keyvault.id
}

output "aks-admin-group-id" {
  value = data.azurerm_key_vault_secret.admin_group_object_ids.value
}

output "vault_uri" {
  value = data.azurerm_key_vault.keyvault.vault_uri
}



