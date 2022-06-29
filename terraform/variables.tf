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

# resource group queue name
variable "resource_group_rg_queue" {
  description = "Resource group database name."
  default     = "rg-queue"
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

# microsoft cdn profile section
# microsoft cdn profile name
variable "cdnp_001_name" {
  description = "The microsoft cdn profile name"
  default     = "cdnp-001"
}

# microsoft cdn profile sku
variable "cdnp_001_sku" {
  description = "The microsoft cdn profile sku"
  default     = "Standard_Microsoft"
}

# end of microsoft cdn profile section

# mysql section
# mysql server name
variable "mysql_001_name" {
  description = "The  mysql server name"
  default     = "mysql-001"
}

# mysql server version
variable "mysql_001_version" {
  description = "The mysql server version"
  default     = "5.7"
}

# mysql server admin login
variable "mysql_001_admin_login" {
  description = "The mysql server admin login"
  default     = "admindbuser"
}

# mysql server admin password
variable "mysql_001_admin_password" {
  description = "The mysql server admin password"
  default     = "P@ssw0rd"
}

# mysql server tls version
variable "mysql_001_tls_version" {
  description = "The mysql server tls version"
  default     = "TLS1_2"
}

# mysql server sku
variable "mysql_001_sku" {
  description = "The mysql server sku"
  default     = "B_Gen5_2"
}

# mysql server storage megabytes
variable "mysql_001_storage_mb" {
  description = "The mysql server storage megabytes"
  default     = "10240"
}

# mysql server backup georedudant
variable "mysql_001_back_geo" {
  description = "The mysql server backup georedudant"
  default     = "false"
}

# mysql server ssl enabled
variable "mysql_001_ssl_enabled" {
  description = "The mysql server ssl enabled"
  default     = "false"
}

# end of mysql section

# private endpoint section
# private endpoint name
variable "pep_mysql_001_name" {
  description = "The private endpoint name"
  default     = "pep-mysql-001"
}

# private endpoint service name
variable "pep_mysql_001_service_name" {
  description = "The private endpoint service name"
  default     = "pep-sn-mysql-connection"
}

# private endpoint subresource names
variable "pep_mysql_001_subresource_name" {
  description = "The mysql server tls version"
  default     = ["sqlServer"]
}

# private endpoint is manual connection
variable "pep_mysql_001_ismc" {
  description = "The private endpoint is manual connection"
  default     = "false"
}

# private endpoint dns zone group
variable "pep_mysql_001_pdzg_name" {
  description = "The private endpoint dns zone group"
  default     = "pep-mysql-001-pdzg"
}

# end of private endpoint section

# private dns section
# private dns zone name
variable "pdnsz_001_name" {
  description = "The private dns zone name"
  default     = "pdnsz-001"
}

# private dns zone virtual network link
variable "pdnsz_vnet_001_name" {
  description = "The private dns zone virtual network link"
  default     = "pdnsz-vnet-001"
}

# private dns zone virtual network enabled auto registration
variable "pdnsz_vnet_001_re" {
  description = "The private dns zone virtual network enabled auto registration"
  default     = "true"
}

# end of private dns section

# user assigned identity section
# user assigned identity name
variable "aks_ap_001_id_name" {
  description = "The user assigned identity name"
  default     = "aks-ap-001-id"
}

# end of user assigned identity section

# application insights section
# application insights name
variable "appi_ap_001_name" {
  description = "The application insights name"
  default     = "appi-ap-001"
}

# application insights application type
variable "appi_ap_001_type" {
  description = "The application insights application type"
  default     = "Node.JS"
}

# application insights action rule group name
variable "acg_ap_001_name" {
  description = "The application insights action rule group name"
  default     = "ag-001"
}

# application insights action rule group short name
variable "acg_ap_001_short_name" {
  description = "The application insights action rule group short name"
  default     = "ag-001"
}

# application insights smart detector alert rule name
variable "sdar_app_001_name" {
  description = "The application insights action rule group short name"
  default     = "sdar-ag-001"
}

# application insights smart detector alert rule severity
variable "sdar_app_001_severity" {
  description = "The application insights smart detector alert rule"
  default     = "Sev0"
}

# application insights smart detector alert rule frequency
variable "sdar_app_001_frequency" {
  description = "The application insights smart detector alert rule frequency"
  default     = "PT1M"
}

# application insights smart detector alert rule type
variable "sdar_app_001_detector_type" {
  description = "The application insights smart detector alert rule type"
  default     = "FailureAnomaliesDetector"
}

# end of application insights section

# kubernetes section
# kubernetes name
variable "aks_ap_001_name" {
  description = "The kubernetes name"
  default     = "aks-ap-001"
}

# kubernetes dns prefix
variable "aks_ap_001_dns_prefix" {
  description = "The kubernetes dns prefix"
  default     = "aks-ap-001"
}

# kubernetes version
variable "aks_ap_001_version" {
  description = "The kubernetes version"
  default     = "1.21.2"
}

# kubernetes node pool name
variable "aks_ap_001_npn" {
  description = "The kubernetes node pool name"
  default     = "default"
}

# kubernetes node pool node count
variable "aks_ap_001_nc" {
  description = "The kubernetes node pool node count"
  default     = "1"
}

# kubernetes node pool vm tier
variable "aks_ap_001_vm_size" {
  description = "The kubernetes node pool vm tier"
  default     = "Standard_D2_v2"
}

# kubernetes identity type
variable "aks_ap_001_identity_type" {
  description = "The kubernetes identity type"
  default     = "UserAssigned"
}

# end of kubernenetes section

# azure function app section
# azure storage name
variable "st_function_001_name" {
  description = "The azure function name"
  default     = "stfuncaulapp001"
}

# azure storage tier
variable "st_function_001_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_001_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function server plan name
variable "app_service_plan_001_name" {
  description = "The azure function server plan name"
  default     = "srv-func-ap-001"
}

# azure function server plan os type
variable "app_service_plan_001_os_type" {
  description = "The azure function server plan os type"
  default     = "Linux"
}

# azure function server plan sku
variable "app_service_plan_001_sku" {
  description = "The azure function server plan sku"
  default     = "Y1"
}

 # azure function app name
variable "func_app_001_name" {
  description = "The azure function app name"
  default     = "func-001"
}

# azure storage name
variable "st_function_002_name" {
  description = "The azure function name"
  default     = "stfuncaulapp002"
}

# azure storage tier
variable "st_function_002_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_002_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function app name
variable "func_app_002_name" {
  description = "The azure function app name"
  default     = "func-002"
}

# azure storage name
variable "st_function_003_name" {
  description = "The azure function name"
  default     = "stfuncaulapp003"
}

# azure storage tier
variable "st_function_003_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_003_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function app name
variable "func_app_003_name" {
  description = "The azure function app name"
  default     = "func-003"
}

# azure storage name
variable "st_function_004_name" {
  description = "The azure function name"
  default     = "stfuncaulapp004"
}

# azure storage tier
variable "st_function_004_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_004_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function app name
variable "func_app_004_name" {
  description = "The azure function app name"
  default     = "func-004"
}

# azure storage name
variable "st_function_005_name" {
  description = "The azure function name"
  default     = "stfuncaulapp005"
}

# azure storage tier
variable "st_function_005_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_005_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function app name
variable "func_app_005_name" {
  description = "The azure function app name"
  default     = "func-005"
}

# azure storage name
variable "st_function_006_name" {
  description = "The azure function name"
  default     = "stfuncaulapp006"
}

# azure storage tier
variable "st_function_006_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_006_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function app name
variable "func_app_006_name" {
  description = "The azure function app name"
  default     = "func-006"
}

# azure storage name
variable "st_function_007_name" {
  description = "The azure function name"
  default     = "stfuncaulapp007"
}

# azure storage tier
variable "st_function_007_tier" {
  description = "The azure storage tier"
  default     = "Standard"
}

# azure storage for function replication type
variable "st_function_007_repl_type" {
  description = "The azure storage for function replication type"
  default     = "LRS"
}

# azure function app name
variable "func_app_007_name" {
  description = "The azure function app name"
  default     = "func-007"
}

# end of azure function app

# service bus section
# azure service bus name
variable "sb_ap_001_name" {
  description = "The service bus namespace name"
  default     = "sb-001"
}

# azure service bus sku
variable "sb_ap_001_sku" {
  description = "The service bus sku"
  default     = "Standard"
}

# end of service bus section