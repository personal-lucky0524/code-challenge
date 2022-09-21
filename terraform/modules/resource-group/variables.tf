variable "resource_group_name" {
  description = "name of the rg group"
  type        = string
}

variable "location" {
  description = "The data centre location where all resources will be put into"
  type        = string
}

variable "Environment" {
  description = "Environemt name all resources will be deployed"
  type        = string
}

variable "Created_By" {
  description = "Who created all the resources"
  type        = string
}