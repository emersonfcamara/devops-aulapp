##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

# general variables
# azure location to create all the resources
variable "location" {
  description = "The region where the virtual network is created."
  default     = "eastus2"
}

# resource group infra name
variable "resource_group_rg_infra" {
  description = "Resource group infra name."
  default     = "rg-infra"
}

# resource group application name
variable "resource_group_rg_application" {
  description = "Resource group application name."
  default     = "rg-application"
}

# resource group cache name
variable "resource_group_rg_cache" {
  description = "Resource group cache name."
  default     = "rg-cache"
}

# resource group security name
variable "resource_group_rg_security" {
  description = "Resource group security name."
  default     = "rg-security"
}

# resource group database name
variable "resource_group_rg_database" {
  description = "Resource group database name."
  default     = "rg-database"
}
# end of general variables

# storage variables
# storage account name for media files
variable "stamedia_name" {
  description = "storage account name for media files"
  default     = "stamedia"
}

# storage account tier for media files
variable "stamedia_tier" {
  description = "The storage account tier for media files"
  default     = "Standard"
}

# storage account replica type for media files
variable "stamedia_replica_type" {
  description = "storage account replica type for media files"
  default     = "LRS"
}

# storage account name for spa site
variable "staspa_name" {
  description = "storage account name for spa site"
  default     = "staspa"
}

# storage account tier for spa site
variable "staspa_tier" {
  description = "storage account tier for spa site"
  default     = "Standard"
}

# storage account replica type for spa site
variable "staspa_replica_type" {
  description = "The storage account replica type for spa site"
  default     = "LRS"
}
# end of storage variables

# network variables
# virtual network name
variable "virtual_network_name" {
  description = "The name for your virtual network."
  default     = "vnet-ap-001"
}

# virtual network address spaces
variable "network_address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["10.5.0.0/16"]
}

# subnet name for application gateway
variable "snet_ap_agw_name" {
  description = "The name to use for the application gateway subnet."
  default     = "snet-ap-agw"
}

# subnet address for application gateway
variable "snet_ap_agw_prefix" {
  description = "The address to use for the application gateway subnet."
  default     = "10.5.1.0/24"
}

# subnet name for kubernetes
variable "snet_ap_aks_name" {
  description = "The name to use for the kubernetes subnet."
  default     = "snet-ap-aks"
}

# subnet address for kubernetes
variable "snet_ap_aks_prefix" {
  description = "The address to use for the kubernetes subnet."
  default     = "10.6.0.0/20"
}

# subnet name for database
variable "snet_ap_db_name" {
  description = "The name to use for the datanase subnet."
  default     = "snet-ap-db"
}

# subnet address for database
variable "snet_ap_db_prefix" {
  description = "The address to use for the database subnet."
  default     = "10.5.0.0/24"
}

# public ip name for application gateway
variable "pip_agw_ap_001_name" {
  description = "The name for public ip for application gateway 001."
  default     = "pip-agw-ap-001"
}

# public ip method for application gateway
variable "pip_agw_ap_001_allocation_method" {
  description = "The type to alocate the public ip resource."
  default     = "Static"
}

# public ip sku for application gateway
variable "pip_agw_ap_001_sku" {
  description = "public ip sku for application gateway"
  default     = "Standard"
}

# front door name
variable "fd_aulapp_name" {
  description = "The front door name"
  default     = "fd-aulapp"
}

# front door routing rule name
variable "fd_aulapp_rr_name" {
  description = "The front door routing rule name"
  default     = "fd-aulapp-rr-name"
}

# front door routing rule accepeted protocol
variable "fd_aulapp_rr_ap" {
  description = "The front door routing rule accepeted protocol"
  default     = ["Http", "Https"]
}

# front door routing rule accepeted patterns
variable "fd_aulapp_rr_patterns" {
  description = "The front door routing rule accepeted patterns"
  default     = ["/*"]
}

# front door routing rule accepeted front end name
variable "fd_aulapp_fe_name" {
  description = "The front door routing rule accepeted front end name"
  default     = "fd-aulapp-fe-name"
}

# front door routing rule foward configuration fowarding protocol
variable "fd_aulapp_rr_fc_fp" {
  description = "the front door routing rule foward configuration fowarding protocol"
  default     = "MatchRequest"
}

# front door routing rule foward configuration backend pool name
variable "fd_aulapp_bp_name" {
  description = "The front door routing rule foward configuration backend pool name"
  default     = "fd-aulapp-bp-name"
}

# front door backend pool load balancing name
variable "fd_aulapp_bplb" {
  description = "The front door backend pool load balancing name"
  default     = "fd-aulapp-bplb"
}

# front door backend pool health probe
variable "fd_aulapp_bphp" {
  description = "The front door backend pool health probe "
  default     = "fd-aulapp-bphp"
}

# front door backend pool host header
variable "fd_aulapp_bp_bhh" {
  description = "The front door backend pool host header"
  default     = "www.google.com"
}

# front door backend pool address
variable "fd_aulapp_bp_ba" {
  description = "The front door backend pool address"
  default     = "www.google.com"
}

# front door backend pool http port
variable "fd_aulapp_bp_bhttp" {
  description = "The front door backend pool http port"
  default     = "80"
}

# front door backend pool https port
variable "fd_aulapp_bp_bhttps" {
  description = "The front door backend pool https port"
  default     = "443"
}

# front door frontend host name
variable "fd_aulapp_fe_hn" {
  description = "The front door frontend host name"
  default     = "fd-aulapp-fe-hn.azurefd.net"
}

# application gateway name
variable "agw_ap_001_name" {
  description = "The application gateway name"
  default     = "agw-ap-001"
}

# application gateway sku
variable "agw_ap_001_sku" {
  description = "The application gateway sku"
  default     = "Standard_Small"
}

# application gateway sku tier
variable "agw_ap_001_sku_tier" {
  description = "The application gateway sku tier"
  default     = "Standard_v2"
}

# application gateway capacity
variable "agw_ap_001_capacity" {
  description = "The application gateway capacity"
  default     = "2"
}

# application gateway ip configuration
variable "agw_ap_001_ip_conf" {
  description = "The application gateway ip configuration"
  default     = "agw-ap-001-ip-configuration"
}

# application gateway frontend port name
variable "agw_ap_001_fp_name" {
  description = "The application gateway frontend port name"
  default     = "agw-ap-001-fp-name"
}

# application gateway frontend port number
variable "agw_ap_001_fp_number" {
  description = "The application gateway frontend port number"
  default     = "80"
}

# application gateway frontend port ip name
variable "agw_ap_001_fp_ip_name" {
  description = "The application gateway frontend port ip name"
  default     = "agw-ap-001-fp-ip-name"
}

# application gateway back address poll name
variable "agw_ap_001_bap_name" {
  description = "The application gateway back address poll name"
  default     = "agw-ap-001-bap-name"
}

# application gateway backend https name
variable "agw_ap_001_bhs_name" {
  description = "The application gateway backend https name"
  default     = "agw-ap-001-bhs-name"
}

# application gateway backend https cookie base affinity
variable "agw_ap_001_bhs_cba" {
  description = "The application gateway backend https cookie base affinity"
  default     = "Disabled"
}

# application gateway backend https path
variable "agw_ap_001_bhs_path" {
  description = "The application gateway backend https path"
  default     = "/"
}

# application gateway backend https port
variable "agw_ap_001_bhs_port" {
  description = "The application gateway backend https port"
  default     = "80"
}

# application gateway backend https protocol
variable "agw_ap_001_bhs_protocol" {
  description = "The application gateway backend https protocol"
  default     = "Http"
}

# application gateway backend https request timeout
variable "agw_ap_001_bhs_rt" {
  description = "The application gateway backend https request timeout"
  default     = "60"
}

# application gateway http listener name
variable "agw_ap_001_hl_name" {
  description = "The application gateway http listener name"
  default     = "agw-ap-001-hl-name"
}

# application gateway http listener front ip configuration name
variable "agw_ap_001_hl_ficn" {
  description = "The application gateway http listener front ip configuration name"
  default     = "agw-ap-001-hl-ficn"
}

# application gateway http listener front port name
variable "agw_ap_001_hl_port_name" {
  description = "The application gateway http listener front port name"
  default     = "agw-ap-001-hl-port-name"
}

# application gateway http listener protocol
variable "agw_ap_001_hl_protocol" {
  description = "The application gateway http listener protocol"
  default     = "Http"
}

# application gateway request routing rule name
variable "agw_ap_001_rrr_name" {
  description = "The application gateway request routing rule name"
  default     = "agw-ap-001-rrr-name"
}

# application gateway request routing rule type
variable "agw_ap_001_rrr_rule_type" {
  description = "The application gateway request routing rule type"
  default     = "Basic"
}

# application gateway request routing rule priority
variable "agw_ap_001_rrr_priority" {
  description = "The application gateway request routing rule priority"
  default     = "10"
}
# end of network variables

# section key vault
# key vault name
variable "kv_ap_001_name" {
  description = "The key vault name"
  default     = "kv-ap-001"
}

# key vault disk encryption
variable "kv_ap_001_disk_encryption" {
  description = "The key vault disk encryption"
  default     = "true"
}

# key vault retention period
variable "kv_ap_001_retention" {
  description = "The key vault retention period"
  default     = "7"
}

# key vault protection enabled
variable "kv_ap_001_protection_enabled" {
  description = "The key vault protection enabled"
  default     = "false"
}

# key vault sku
variable "kv_ap_001_sku" {
  description = "The key vault sku"
  default     = "standard"
}

# key vault tenant id
variable "kv_ap_001_tenant_id" {
  description = "The key vault tenant id"
  default     = "b84fa403-e0cd-458c-b2e2-6538be09e2d8"
}

# end of section key vault