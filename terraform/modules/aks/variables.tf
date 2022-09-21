# General variables 
variable "Environment" {
  description = "The name for identifying the type of environment"
  type        = string
}

variable "location" {
  description = "The data center location where all resources will be put into."
  type        = string
}

variable "Created_By" {
  description = "Who created this resource"
  type        = string
}

variable "cluster_name" {
  description = "The resoursce name to allocate."
  type        = string
}

variable "resource_group_name" {
  description = " Specifies the Resource Group where resource needs to be created."
  type        = string
}

#aks cluster variables 
variable "kubernetes_version" {
}

variable "dns_prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group."
  type        = string
}
variable "private_cluster_enabled" {
  description = " Kubernetes Cluster have it's API server only exposed on internal IP addresses"
  type        = bool
  default     = false
}
variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
  type        = string
}

# default node pool 
variable "node_type" {
  default     = "VirtualMachineScaleSets"
  description = "The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets"
  type        = string

}
variable "initial_node_count" {
  description = "The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count"
  default     = 3
  type        = number

}
variable "node_size" {
  default     = "Standard_DS2_v2"
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
}
variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 30
}
variable "vnet_subnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist"
  type        = string
  default     = null
}
variable "enable_auto_scaling" {
  description = "default value is set to false."
  type        = string
  default     = false
}
variable "node_min_count" {
  description = "The maximum number of nodes which should exist in this Node Pool"
  type        = number
  default     = 1
}
variable "node_max_count" {
  description = "The minimum number of nodes which should exist in this Node Pool"
  type        = number
  default = 3
}
variable "max_pods" {
  description = "The maximum number of pods that can run on each agent"
  type        = number
  default     = null
}

# addon_profile variables
variable "enable_http_application_routing" {
  description = "Enable HTTP Application Routing Addon (forces recreation)."
  type        = bool
  default     = false
}
variable "enabled_oms_agent" {
  description = "enable if you want monitoring in aks"
  type        = bool
  default     = true
}

variable "enabled_aci_connector_linux" {
  description = "for configuring the virtul nodes"
  type        = bool
  default     = false
}
variable "subnet_name" {
  description = "The subnet name for the virtual nodes to run."
  type        = string
}

# network_profile variables

variable "network_plugin" {
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet"
  type        = string
  default     = "azure"
}

variable "network_policy" {
    description = "Sets up network policy to be used with Azure CNI"
    type        = string
    default     = "azure"
}

variable "outbound_type" {
  description = "he outbound (egress) routing method which should be used for this Kubernetes Cluster"
  type        = string
  default     = "loadBalancer"
}

variable "load_balancer_sku" {
  description = "Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard"
  type        = string
  default     = "Standard"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  type        = number
  default     = 30
}

#rbac variables 
variable "role_based_access_control" {
  description = "rbac enabled in aks cluster"
  type        = bool
  default     = true
}

#AD integration 
variable "azure_active_directory_enabled" {
  description = "managed ad integtaion  in aks cluster"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
}

variable "addons" {
  description = "Defines which addons will be activated."
  type = object({
    oms_agent            = bool
    azure_policy         = bool
  })
}

