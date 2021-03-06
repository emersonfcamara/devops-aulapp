##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

# general variables
location = "eastus2"

# resource group infra name
resource_group_rg_infra = "rg-hlg-infra"

# resource group application name
resource_group_rg_application = "rg-hlg-application"

# resource group cache name
resource_group_rg_cache = "rg-hlg-cache"

# resource group security name
resource_group_rg_security = "rg-hlg-security"

# resource group database name
resource_group_rg_database = "rg-hlg-database"

# resource group queue name
resource_group_rg_queue = "rg-hlg-queue"
# end of general variables

# network variables
# virtual network name
virtual_network_name = "vnet-ap-hlg-001"

# virtual network address spaces
network_address_space = ["10.5.0.0/16", "10.6.0.0/20"]

# subnet name for application gateway
snet_ap_agw_name = "snet-ap-hlg-agw"

# subnet address for application gateway
snet_ap_agw_prefix = "10.5.1.0/24"

# subnet name for kubernetes
snet_ap_aks_name = "snet-ap-hlg-aks"

# subnet address for kubernetes
snet_ap_aks_prefix = "10.6.0.0/20"

# subnet name for database
snet_ap_db_name = "snet-ap-hlg-db"

# subnet address for database
snet_ap_db_prefix = "10.5.0.0/24"

# subnet name for virtual network vpn gateway
snet_ap_vng_name = "GatewaySubnet"

# subnet address for virtual network vpn gateway
snet_ap_vng_prefix = "10.5.2.0/24"

# virtual network gateway name
vng_ap_001_name = "vng-ap-hlg-001"

# virtual network gateway type
vng_ap_001_type = "Vpn"

# virtual network gateway vpn type
vng_ap_001_vpn_type = "RouteBased"

# virtual network gateway active active
vng_ap_001_active_active = "false"

# virtual network gateway enable bgp
vng_ap_001_enable_bgp = "false"

# virtual network gateway sku
vng_ap_001_sku = "VpnGw1"

# virtual network gateway ip configuration name
vng_ap_001_ic_name = "vng-ap-001-hlg-ic-name"

# virtual network gateway ip configuration public ip allocation
vng_ap_001_ic_pia = "Dynamic"

# virtual network gateway vpn client configuration address
vng_ap_001_vcc_address = ["10.7.0.0/24"]

# virtual network gateway vpn client configuration root certificate name
vng_ap_001_vcc_rc_name = "DigiCert-Federated-ID-Root-CA"

# virtual network gateway vpn client configuration public cert data
vng_ap_001_vcc_rc_data = <<EOF
MIIC+TCCAeGgAwIBAgIQO5hRjweGzbZIHD/g9EheETANBgkqhkiG9w0BAQsFADAf
MR0wGwYDVQQDDBRDZXJ0aWZpY2Fkb1ByaW5jaXBhbDAeFw0yMjA3MjAxODUwNDJa
Fw0yMzA3MjAxOTEwNDJaMB8xHTAbBgNVBAMMFENlcnRpZmljYWRvUHJpbmNpcGFs
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuBobWRXxgm7Qe6cIQU2h
fELNXsV4Z7CFZ4JgCHjgfCb3pXQrUSpd/StSXOrgCSRNAHHPhVRuN1EGeY9CCkCJ
6APIh4MmBLC2Qaa1zgii8Iy0VtLtl3+rfnlj8dePj9Ck97BbdjKJnneiqs4madAE
hmt8GQiZH9wJbMefrfdbDc4yOuKTcqe/rvMZFMsGnJgsL7KFt7rkiEPYLKmBlv9q
w7dQ+1MC66emWLyzzUKrk4FK1v5vZXY6GtihqmtGNN0iggtGNfT8E72crJCUT+XZ
NebElIqHfvw2tMKqrKMFR+Pcr5RXvYzTySmbbmtMQzo+vHAeZVctDy4tJHQFcvBw
FQIDAQABozEwLzAOBgNVHQ8BAf8EBAMCAgQwHQYDVR0OBBYEFJt53EvWrFuN5Fr7
vPUD9HwyMKzmMA0GCSqGSIb3DQEBCwUAA4IBAQClzaWGwMyrRctePKZICSAiRz6n
HKm4a63uyvX9MZRuOMr76likYD8GS/UEyhgfFeoHIpg2HJBZvM95jB2c8to6cH7A
LVuZTo5D4DxPhH1+1v5+7X6PE18gRgi0kHb9t8RgHvfEBGIi2PTZJjdyEYCiUAmf
bQNOnqodzvC5hHbG48xRDS32PoeN7C6FwnEQVMKS8vfV+Mx45sopEVSm/kCA22av
0KhI4ua61mvqiqukOoMz2vy9yWZEd9Hfg6qeeV5stl+8n8sAxzPmx1M7aeJqohBo
LmPduu0qpTxMFIP48UboYcMLAaxqQYRa8gt/9p8k8+nGuN7hJ+VHKdfEJ9J7
EOF

# virtual network gateway vpn client configuration revoke certificate name
vng_ap_001_vcc_revc_name = "Verizon-Global-Root-CA"

# virtual network gateway vpn client configuration revoke certificate thumb
vng_ap_001_vcc_revc_thumb = "912198EEF23DCAC40939312FEE97DD560BAE49B1"

# public ip name for application gateway
pip_agw_ap_001_name = "pip-agw-ap-hlg-001"

# public ip allocation method for application gateway
pip_agw_ap_001_allocation_method = "Static"

# public ip sku for application gateway
pip_agw_ap_001_sku = "Standard"

# public ip name for virtual network gateway
pip_vng_ap_001_name = "pip-vng-ap-hlg-001"

# public ip method for virtual network gateway
pip_vng_ap_001_allocation_method = "Static"

# public ip sku for virtual network gateway
pip_vng_ap_001_sku = "Standard"

# front door name
fd_aulapp_name = "fd-hlg-aulapp"

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

# front door backend pool settings receive timeout
fd_aulapp_bps_rts = "0"

# front door backend pool settings certificate name check
fd_aulapp_bps_cnc = "false"

# application gateway name
agw_ap_001_name = "agw-ap-hlg-001"

# application gateway sku
agw_ap_001_sku = "Standard_v2"

# application gateway sku tier
agw_ap_001_sku_tier = "Standard_v2"

# application gateway capacity
agw_ap_001_capacity = "2"

# application gateway ip configuration
agw_ap_001_ip_conf = "agw-ap-hlg-001-ip-configuration"

# application gateway frontend port name
agw_ap_001_fp_name = "agw-ap-hlg-001-fp-name"

# application gateway frontend port number
agw_ap_001_fp_number = "80"

# application gateway frontend port ip name
agw_ap_001_fp_ip_name = "agw-ap-hlg-001-fp-ip-name"

# application gateway back address poll name
agw_ap_001_bap_name = "agw-ap-hlg-001-bap-name"

# application gateway backend https name
agw_ap_001_bhs_name = "agw-ap-hlg-001-bhs-name"

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
agw_ap_001_hl_name = "agw-ap-hlg-001-hl-name"

# application gateway http listener front ip configuration name
agw_ap_001_hl_ficn = "agw-ap-hlg-001-hl-ficn"

# application gateway http listener front port name
agw_ap_001_hl_port_name = "agw-ap-hlg-001-hl-port-name"

# application gateway http listener protocol
agw_ap_001_hl_protocol = "Http"

# application gateway request routing rule name
agw_ap_001_rrr_name = "agw-ap-hlg-001-rrr-name"

# application gateway request routing rule type
agw_ap_001_rrr_rule_type = "Basic"

# application gateway request routing rule priority
agw_ap_001_rrr_priority = "10"
# end of network variables

# storage variables
# storage account name for media files
stamedia_name = "stahlgmedia"

# storage account tier for media files
stamedia_tier = "Standard"

# storage account replica type for media files
stamedia_replica_type = "LRS"

# storage account name for spa site
staspa_name = "stahlgspa"

# storage account tier for spa site
staspa_tier = "Standard"

# storage account replica type for spa site
staspa_replica_type = "LRS"
# end of storage variables

# key vault section
# key vault name
kv_ap_001_name = "kv-ap-hlg-001"

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
cdnp_001_name = "cdnp-hlg-001"

# microsoft cdn profile sku
cdnp_001_sku  = "Standard_Microsoft"

# end of microsoft cdn profile section

# mysql section
# mysql server name
mysql_001_name = "mysql-aulapp-hlg-001"

# mysql server version
mysql_001_version = "5.7"

# mysql server admin login
mysql_001_admin_login = "admindbuser"

# mysql server admin password
mysql_001_admin_password = "t2wwJdHYsfAJ"

# mysql server tls version
mysql_001_tls_version = "TLS1_2"

# mysql server sku
mysql_001_sku = "GP_Gen5_2"

# mysql server storage megabytes
mysql_001_storage_mb = "30720"

# mysql server backup georedudant
mysql_001_back_geo = "false"

# mysql server ssl enabled
mysql_001_ssl_enabled = "false"

mysql_001_fwr_azuresvc_name = "AzureService"

# end of mysql section

# private endpoint section
# private endpoint name
pep_mysql_001_name = "pep-mysql-hlg-001"

# private endpoint service name
pep_mysql_001_service_name = "pep-sn-mysql-hlg-connection"

# private endpoint subresource names
pep_mysql_001_subresource_name = ["mysqlServer"]

# private endpoint is manual connection
pep_mysql_001_ismc = "false"

# private endpoint dns zone group
pep_mysql_001_pdzg_name = "pep-mysql-001-pdzg"

# end of private endpoint section

# private dns section
# private dns zone name
pdnsz_001_name = "aulapphlg.com"

# private dns zone virtual network link
pdnsz_vnet_001_name = "pdnsz-vnet-hlg-001"

# private dns zone virtual network enabled auto registration
pdnsz_vnet_001_re = "true"

# end of private dns section

# user assigned identity section
# user assigned identity name
aks_ap_001_id_name = "aks-ap-hlg-001-id"

# end of user assigned identity section

# application insights section
# application insights name
appi_ap_001_name = "appi-ap-hlg-001"

# application insights application type
appi_ap_001_type = "Node.JS"

# application insights action rule group name
acg_ap_001_name = "ag-hlg-001"

# application insights action rule group short name
acg_ap_001_short_name = "ag-hlg-001"

# application insights smart detector alert rule name
sdar_app_001_name = "sdar-ag-hlg-001"

# application insights smart detector alert rule
sdar_app_001_severity = "Sev0"

# application insights smart detector alert rule frequency
sdar_app_001_frequency = "PT1M"

# application insights smart detector alert rule type
sdar_app_001_detector_type = "FailureAnomaliesDetector"

# end of application insights section

# kubernetes section
# kubernetes name
aks_ap_001_name = "aks-ap-hlg-001"

# kubernetes dns prefix
aks_ap_001_dns_prefix = "aks-ap-hlg-001"

# kubernetes version
aks_ap_001_version = "1.22.6"

# kubernetes private cluster
aks_ap_001_private = "true"

# kubernetes node pool name
aks_ap_001_npn = "default"

# kubernetes node pool node count
aks_ap_001_nc = "2"

# kubernetes node pool vm tier
aks_ap_001_vm_size = "Standard_B2ms"

# kubernetes identity type
aks_ap_001_identity_type = "UserAssigned"

# end of kubernenetes section

# container registry section

# container registry name
acr_ap_001_name = "acrapphlg001"

# container registry sku
acr_ap_001_sku = "Standard"

# end of container registry section

# azure role assignment section
# azure role assignment definition name
ara_ap_001_role_def = "AcrPull"

# azure role assignment definition skip check AAD principal
ara_ap_001_role_aad_check = "true"

# end of azure role assigment section

# azure function app section
# azure storage name
st_function_001_name = "stfuncaulapphlg001"

# azure storage tier
st_function_001_tier = "Standard"

# azure storage for function replication type
st_function_001_repl_type = "LRS"

# azure function server plan name
app_service_plan_001_name = "srv-func-ap-hlg-001"

# azure function server plan os type
app_service_plan_001_os_type = "Linux"

# azure function server plan sku
app_service_plan_001_sku = "Y1"

 # azure function app name
func_app_001_name = "func-file-integration-hlg"

# azure function site config application stack version
func_app_001_scas_version = "3.7"

# azure storage name
st_function_002_name = "stfuncaulapphlg002"

# azure storage tier
st_function_002_tier = "Standard"

# azure storage for function replication type
st_function_002_repl_type = "LRS"

# azure function app name
func_app_002_name = "func-file-integration-hlg-queue-consumer"

# azure function site config application stack version
func_app_002_scas_version = "3.7"

# azure storage name
st_function_003_name = "stfuncaulapphlg003"

# azure storage tier
st_function_003_tier = "Standard"

# azure storage for function replication type
st_function_003_repl_type = "LRS"

# azure function app name
func_app_003_name = "func-online-notification-hlg-online"

# azure function site config application stack version
func_app_003_scas_version = "3.7"

# azure storage name
st_function_004_name = "stfuncaulapphlg004"

# azure storage tier
st_function_004_tier = "Standard"

# azure storage for function replication type
st_function_004_repl_type = "LRS"

# azure function app name
func_app_004_name = "func-magento-integration-hlg-queue-consumer"

# azure function site config application stack version
func_app_004_scas_version = "3.7"

# azure storage name
st_function_005_name = "stfuncaulapphlg005"

# azure storage tier
st_function_005_tier = "Standard"

# azure storage for function replication type
st_function_005_repl_type = "LRS"

# azure function app name
func_app_005_name = "func-send-notification-hlg-sender"

# azure function site config application stack version
func_app_005_scas_version = "3.7"

# azure storage name
st_function_006_name = "stfuncaulapphlg006"

# azure storage tier
st_function_006_tier = "Standard"

# azure storage for function replication type
st_function_006_repl_type = "LRS"

# azure function app name
func_app_006_name = "func-file-integration-hlg-custom-resource-existing-s3"

# azure function site config application stack version
func_app_006_scas_version = "12"

# azure storage name
st_function_007_name = "stfuncaulapphlg007"

# azure storage tier
st_function_007_tier = "Standard"

# azure storage for function replication type
st_function_007_repl_type = "LRS"

# azure function app name
func_app_007_name = "func-magento-integration-hlg"

# azure function site config application stack version
func_app_007_scas_version = "3.7"

# end of azure function app

# service bus section
# azure service bus name
sb_ap_001_name = "sb-hlg-001"

# azure service bus sku
sb_ap_001_sku = "Standard"

# azure service queue name
sbs_enrich_uat_name = "sbs-enrich-uat"

# azure service bus queue partition enabled"
sbs_enrich_uat_ep = "true"

# azure service bus queue dead lead queue enabled"
sbs_enrich_uat_dlq = "false"

# azure service queue name
sbs_file_integration_uat_name = "sbs-file-integration-uat"

# azure service bus queue partition enabled"
sbs_file_integration_uat_ep = "true"

# azure service bus queue dead lead queue enabled"
sbs_file_integration_uat_dlq = "false"

# azure service queue name
sbs_magento_integration_uat_name = "sbs-magento-integration-uat"

# azure service bus queue partition enabled"
sbs_magento_integration_uat_ep = "true"

# azure service bus queue dead lead queue enabled"
sbs_magento_integration_uat_dlq = "false"

# azure service queue name
sbs_notification_online_uat_name = "sbs-notification-online-uat"

# azure service bus queue partition enabled"
sbs_notification_online_uat_ep = "true"

# azure service bus queue dead lead queue enabled"
sbs_notification_online_uat_dlq = "true"

# end of service bus section