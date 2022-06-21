##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

variable "resource_group_rg_infra" {
  description = "Resource group infra name."
  default     = "rg-hml-infra"
}

variable "resource_group_rg_application" {
  description = "Resource group application name."
  default     = "rg-hml-application"
}

variable "resource_group_rg_cache" {
  description = "Resource group cache name."
  default     = "rg-hml-cache"
}

variable "resource_group_rg_security" {
  description = "Resource group security name."
  default     = "rg-hml-security"
}

variable "resource_group_rg_database" {
  description = "Resource group database name."
  default     = "rg-hml-database"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "east-us-2"
}

variable "virtual_network_name" {
  description = "The name for your virtual network."
  default     = "vnet-ap-hml-001"
}

variable "network_address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.5.0.0/16"
}

variable "snet_ap_agw_name" {
  description = "The name to use for the application gateway subnet."
  default     = "snet-ap-hml-agw"
}

variable "snet_ap_agw_prefix" {
  description = "The address to use for the application gateway subnet."
  default     = "10.5.1.0/24"
}

variable "snet_ap_aks_name" {
  description = "The name to use for the kubernetes subnet."
  default     = "snet-ap-hml-aks"
}

variable "snet_ap_aks_prefix" {
  description = "The address to use for the kubernetes subnet."
  default     = "10.6.0.0/20"
}

variable "snet_ap_db_name" {
  description = "The name to use for the datanase subnet."
  default     = "snet-ap-hml-db"
}

variable "snet_ap_db_prefix" {
  description = "The address to use for the database subnet."
  default     = "10.5.0.0/24"
}