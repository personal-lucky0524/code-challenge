variable "vnet_name" {
  description   = "Name of the Vnet"
  type          = string
}
variable "subnet_name" {
  description   = "Name of the aks subnet"
  type          = string
}
variable "Environment" {
  description   = "Environemt name all resources will be deployed"
  type          = string
}
variable "Created_By" {
  description   = "Who created all the resources"
  type          = string
}

variable "address_space" {
  description   = "The address space of the virtual network and subnets"
  type          = list(string)
}
variable "address_prefixes" {
  description   = "The address space of the aks subnet"
  type          = list(string)
}
variable "resource_group_name" {
  description = "name of the rg group"
  type        = string
}
variable "location" {
  description = "The data centre location where all resources will be put into"
  type        = string
}
