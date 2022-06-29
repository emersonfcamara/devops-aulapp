##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

# general variables
location = "eastus2"

# resource group infra name
resource_group_rg_infra = "rg-hml-infra"

# resource group application name
resource_group_rg_application = "rg-hml-application"

# resource group cache name
resource_group_rg_cache = "rg-hml-cache"

# resource group security name
resource_group_rg_security = "rg-hml-security"

# resource group database name
resource_group_rg_database = "rg-hml-database"

# resource group queue name
resource_group_rg_queue = "rg-hml-queue"
# end of general variables

# network variables
# virtual network name
virtual_network_name = "vnet-ap-hml-001"

# virtual network address spaces
network_address_space = ["10.5.0.0/16", "10.6.0.0/20"]

# subnet name for application gateway
snet_ap_agw_name = "snet-ap-hml-agw"

# subnet address for application gateway
snet_ap_agw_prefix = "10.5.1.0/24"

# subnet name for kubernetes
snet_ap_aks_name = "snet-ap-hml-aks"

# subnet address for kubernetes
snet_ap_aks_prefix = "10.6.0.0/20"

# subnet name for database
snet_ap_db_name = "snet-ap-hml-db"

# subnet address for database
snet_ap_db_prefix = "10.5.0.0/24"

# public ip name for application gateway
pip_agw_ap_001_name = "pip-agw-ap-hml-001"

# public ip allocation method for application gateway
pip_agw_ap_001_allocation_method = "Static"

# public ip sku for application gateway
pip_agw_ap_001_sku = "Standard"

# front door name
fd_aulapp_name = "fd-hml-aulapp"

# front door routing rule name
fd_aulapp_rr_name = "fd-aulapp-rr-name"

# front door routing rule accepeted protocol
fd_aulapp_rr_ap = ["Http", "Https"]

# front door routing rule accepeted patterns
fd_aulapp_rr_patterns = ["/*"]

# front door routing rule foward configuration fowarding protocol
fd_aulapp_rr_fc_fp = "MatchRequest"

# front door backend pool load balancing name
fd_aulapp_bplb = "fd-aulapp-bplb"

# front door backend pool health probe
fd_aulapp_bphp = "fd-aulapp-bphp"

# front door backend pool health probe
fd_aulapp_bp_name = "fd-aulapp-bp-name"

# front door backend pool host header
fd_aulapp_bp_bhh = "www.google.com"

# front door backend pool address
fd_aulapp_bp_ba = "www.google.com"

# front door backend pool http port
fd_aulapp_bp_bhttp = "80"

# front door backend pool https port
fd_aulapp_bp_bhttps = "443"

# front door frontend name
fd_aulapp_fe_name = "fd-aulapp-fe-name"

# front door frontend host name
fd_aulapp_fe_hn = "fd-aulapp-fe-hn.azurefd.net"

# application gateway name
agw_ap_001_name = "agw-ap-hml-001"

# application gateway sku
agw_ap_001_sku = "Standard_v2"

# application gateway sku tier
agw_ap_001_sku_tier = "Standard_v2"

# application gateway capacity
agw_ap_001_capacity = "2"

# application gateway ip configuration
agw_ap_001_ip_conf = "agw-ap-hml-001-ip-configuration"

# application gateway frontend port name
agw_ap_001_fp_name = "agw-ap-hml-001-fp-name"

# application gateway frontend port number
agw_ap_001_fp_number = "80"

# application gateway frontend port ip name
agw_ap_001_fp_ip_name = "agw-ap-hml-001-fp-ip-name"

# application gateway back address poll name
agw_ap_001_bap_name = "agw-ap-hml-001-bap-name"

# application gateway backend https name
agw_ap_001_bhs_name = "agw-ap-hml-001-bhs-name"

# application gateway backend https cookie base affinity
agw_ap_001_bhs_cba = "Disabled"

# application gateway backend https path
agw_ap_001_bhs_path = "/"

# application gateway backend https port
agw_ap_001_bhs_port = "80"

# application gateway backend https protocol
agw_ap_001_bhs_protocol = "Http"

# application gateway backend https request timeout
agw_ap_001_bhs_rt = "60"

# application gateway http listener name
agw_ap_001_hl_name = "agw-ap-hml-001-hl-name"

# application gateway http listener front ip configuration name
agw_ap_001_hl_ficn = "agw-ap-hml-001-hl-ficn"

# application gateway http listener front port name
agw_ap_001_hl_port_name = "agw-ap-hml-001-hl-port-name"

# application gateway http listener protocol
agw_ap_001_hl_protocol = "Http"

# application gateway request routing rule name
agw_ap_001_rrr_name = "agw-ap-hml-001-rrr-name"

# application gateway request routing rule type
agw_ap_001_rrr_rule_type = "Basic"

# application gateway request routing rule priority
agw_ap_001_rrr_priority = "10"
# end of network variables

# storage variables
# storage account name for media files
stamedia_name = "stahmlmedia"

# storage account tier for media files
stamedia_tier = "Standard"

# storage account replica type for media files
stamedia_replica_type = "LRS"

# storage account name for spa site
staspa_name = "stahmlspa"

# storage account tier for spa site
staspa_tier = "Standard"

# storage account replica type for spa site
staspa_replica_type = "LRS"
# end of storage variables

# key vault section
# key vault name
kv_ap_001_name = "kv-ap-hml-001"

# key vault disk encryption
kv_ap_001_disk_encryption = "true"

# key vault retention period
kv_ap_001_retention = "7"

# key vault protection enabled
kv_ap_001_protection_enabled = "false"

# key vault sku
kv_ap_001_sku = "standard"

# key vault tenant id
kv_ap_001_tenant_id = "b84fa403-e0cd-458c-b2e2-6538be09e2d8"

# end of key vault section

# microsoft cdn profile section
# microsoft cdn profile name
cdnp_001_name = "cdnp-hml-001"

# microsoft cdn profile sku
cdnp_001_sku  = "Standard_Microsoft"

# end of microsoft cdn profile section

# mysql section
# mysql server name
mysql_001_name = "mysql-aulapp-hml-001"

# mysql server version
mysql_001_version = "5.7"

# mysql server admin login
mysql_001_admin_login = "admindbuser"

# mysql server admin password
mysql_001_admin_password = "t2wwJdHYsfAJ"

# mysql server tls version
mysql_001_tls_version = "TLS1_2"

# mysql server sku
mysql_001_sku = "B_Gen5_2"

# mysql server storage megabytes
mysql_001_storage_mb = "10240"

# mysql server backup georedudant
mysql_001_back_geo = "false"

# mysql server ssl enabled
mysql_001_ssl_enabled = "false"

# end of mysql section

# private endpoint section
# private endpoint name
pep_mysql_001_name = "pep-mysql-hml-001"

# private endpoint service name
pep_mysql_001_service_name = "pep-sn-mysql-hml-connection"

# private endpoint subresource names
pep_mysql_001_subresource_name = ["sqlServer"]

# private endpoint is manual connection
pep_mysql_001_ismc = "false"

# private endpoint dns zone group
pep_mysql_001_pdzg_name = "pep-mysql-001-pdzg"

# end of private endpoint section

# private dns section
# private dns zone name
pdnsz_001_name = "aulapphml.com"

# private dns zone virtual network link
pdnsz_vnet_001_name = "pdnsz-vnet-hml-001"

# private dns zone virtual network enabled auto registration
pdnsz_vnet_001_re = "true"

# end of private dns section

# user assigned identity section
# user assigned identity name
aks_ap_001_id_name = "aks-ap-hml-001-id"

# end of user assigned identity section

# application insights section
# application insights name
appi_ap_001_name = "appi-ap-hml-001"

# application insights application type
appi_ap_001_type = "Node.JS"

# application insights action rule group name
acg_ap_001_name = "ag-hml-001"

# application insights action rule group short name
acg_ap_001_short_name = "ag-hml-001"

# application insights smart detector alert rule name
sdar_app_001_name = "sdar-ag-hml-001"

# application insights smart detector alert rule
sdar_app_001_severity = "Sev0"

# application insights smart detector alert rule frequency
sdar_app_001_frequency = "PT1M"

# application insights smart detector alert rule type
sdar_app_001_detector_type = "FailureAnomaliesDetector"

# end of application insights section

# kubernetes section
# kubernetes name
aks_ap_001_name = "aks-ap-hml-001"

# kubernetes dns prefix
aks_ap_001_dns_prefix = "aks-ap-hml-001"

# kubernetes version
aks_ap_001_version = "1.22.6"

# kubernetes node pool name
aks_ap_001_npn = "default"

# kubernetes node pool node count
aks_ap_001_nc = "1"

# kubernetes node pool vm tier
aks_ap_001_vm_size = "Standard_D2_v2"

# kubernetes identity type
aks_ap_001_identity_type = "UserAssigned"

# end of kubernenetes section

# azure function app section
# azure storage name
st_function_001_name = "stfuncaulapphml001"

# azure storage tier
st_function_001_tier = "Standard"

# azure storage for function replication type
st_function_001_repl_type = "LRS"

# azure function server plan name
app_service_plan_001_name = "srv-func-ap-hml-001"

# azure function server plan os type
app_service_plan_001_os_type = "Linux"

# azure function server plan sku
app_service_plan_001_sku = "Y1"

 # azure function app name
func_app_001_name = "func-file-integration-hml"

# azure storage name
st_function_002_name = "stfuncaulapphml002"

# azure storage tier
st_function_002_tier = "Standard"

# azure storage for function replication type
st_function_002_repl_type = "LRS"

# azure function app name
func_app_002_name = "func-file-integration-hml-queue-consumer"

# azure storage name
st_function_003_name = "stfuncaulapphml003"

# azure storage tier
st_function_003_tier = "Standard"

# azure storage for function replication type
st_function_003_repl_type = "LRS"

# azure function app name
func_app_003_name = "func-online-notification-hml-online"

# azure storage name
st_function_004_name = "stfuncaulapphml004"

# azure storage tier
st_function_004_tier = "Standard"

# azure storage for function replication type
st_function_004_repl_type = "LRS"

# azure function app name
func_app_004_name = "func-magento-integration-hml-queue-consumer"

# azure storage name
st_function_005_name = "stfuncaulapphml005"

# azure storage tier
st_function_005_tier = "Standard"

# azure storage for function replication type
st_function_005_repl_type = "LRS"

# azure function app name
func_app_005_name = "func-send-notification-hml-sender"

# azure storage name
st_function_006_name = "stfuncaulapphml006"

# azure storage tier
st_function_006_tier = "Standard"

# azure storage for function replication type
st_function_006_repl_type = "LRS"

# azure function app name
func_app_006_name = "func-file-integration-hml-custom-resource-existing-s3"

# azure storage name
st_function_007_name = "stfuncaulapphml007"

# azure storage tier
st_function_007_tier = "Standard"

# azure storage for function replication type
st_function_007_repl_type = "LRS"

# azure function app name
func_app_007_name = "func-magento-integration-hml"

# end of azure function app

# service bus section
# azure service bus name
sb_ap_001_name = "sb-hml-001"

# azure service bus sku
sb_ap_001_sku = "Standard"

# end of service bus section