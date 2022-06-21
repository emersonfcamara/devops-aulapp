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
mysql_001_name = "mysql-hml-001"

# mysql server version
mysql_001_version = "12.0"

# mysql server admin login
mysql_001_admin_login = "admindbuser"

# mysql server admin password
mysql_001_admin_password = "t2wwJdHYsfAJ"

# mysql server tls version
mysql_001_tls_version = "1.2"

# end of mysql section

# user assigned identity section
# user assigned identity name
aks_ap_001_id_name = "aks-ap-hml-001-id"

# end of user assigned identity section

# application insights section
# application insights name
appi_ap_001_name = "appi-ap-hml-001"

# application insights application type
appi_ap_001_type = "Node.JS"

# end of application insights section

# kubernetes section
# kubernetes name
aks_ap_001_name = "aks-ap-hml-001"

# kubernetes dns prefix
aks_ap_001_dns_prefix = "aks-ap-hml-001"

# kubernetes version
aks_ap_001_version = "1.22.6"

# kubernetes node pool name
aks_ap_001_npn = "Default"

# kubernetes node pool node count
aks_ap_001_nc = "1"

# kubernetes node pool vm tier
aks_ap_001_vm_size = "Standard_D2_v2"

# kubernetes identity type
aks_ap_001_identity_type = "UserAssigned"

# end of kubernenetes section