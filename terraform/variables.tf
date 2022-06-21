##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

variable "resource_group_rg_infra" {
  description = "Resource group infra name."
  default     = "rg-infra"
}

variable "resource_group_rg_application" {
  description = "Resource group application name."
  default     = "rg-application"
}

variable "resource_group_rg_cache" {
  description = "Resource group cache name."
  default     = "rg-cache"
}

variable "resource_group_rg_security" {
  description = "Resource group security name."
  default     = "rg-security"
}

variable "resource_group_rg_database" {
  description = "Resource group database name."
  default     = "rg-database"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "eastus2"
}

variable "virtual_network_name" {
  description = "The name for your virtual network."
  default     = "vnet-ap-001"
}

variable "network_address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.5.0.0/16"
}

variable "snet_ap_agw_name" {
  description = "The name to use for the application gateway subnet."
  default     = "snet-ap-agw"
}

variable "snet_ap_agw_prefix" {
  description = "The address to use for the application gateway subnet."
  default     = "10.5.1.0/24"
}

variable "snet_ap_aks_name" {
  description = "The name to use for the kubernetes subnet."
  default     = "snet-ap-aks"
}

variable "snet_ap_aks_prefix" {
  description = "The address to use for the kubernetes subnet."
  default     = "10.6.0.0/20"
}

variable "snet_ap_db_name" {
  description = "The name to use for the datanase subnet."
  default     = "snet-ap-db"
}

variable "snet_ap_db_prefix" {
  description = "The address to use for the database subnet."
  default     = "10.5.0.0/24"
}

variable "pip_agw_ap_001_name" {
  description = "The name for public ip for application gateway 001."
  default     = "pip-agw-ap-001"
}

variable "pip_agw_ap_001_allocation_method" {
  description = "The type to alocate the public ip resource."
  default     = "Static"
}