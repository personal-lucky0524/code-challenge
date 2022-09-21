variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  type        = string
  default     = "PerGB2018"
}
variable "log_analytics_workspace_name" {
}
variable "location" {
}
variable "resource_group_name" {
}
variable "log_retention_in_days" {
}
variable "Environment" {
}
variable "Created_By" {
}
