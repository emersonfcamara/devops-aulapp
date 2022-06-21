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

# front door name
fd_aulapp_name = "fd-hml-aulapp"

# front door sku
fd_aulapp_sku = "Standard_AzureFrontDoor"

# application gateway name
agw_ap_001_name = "agw-ap-hml-001"

# application gateway sku
agw_ap_001_sku = "Standard_Small"

# application gateway sku tier
agw_ap_001_sku_tier = "Standard"

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
stamedia_name = "stahmlmedia"
stamedia_tier = "Standard"
stamedia_replica_type = "LRS"
staspa_name = "stahmlspa"
staspa_tier = "Standard"
staspa_replica_type = "LRS"
# end of storage variables

