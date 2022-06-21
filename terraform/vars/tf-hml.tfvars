##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

tfstate-container = "tfstate"
tfstate-key = "hml-state"
resource_group_rg_infra = "rg-hml-infra"
resource_group_rg_application = "rg-hml-application"
resource_group_rg_cache = "rg-hml-cache"
resource_group_rg_security = "rg-hml-security"
resource_group_rg_database = "rg-hml-database"
location = "eastus2"
virtual_network_name = "vnet-ap-hml-001"
network_address_space = ["10.5.0.0/16", "10.6.0.0/20"]
snet_ap_agw_name = "snet-ap-hml-agw"
snet_ap_agw_prefix = "10.5.1.0/24"
snet_ap_aks_name = "snet-ap-hml-aks"
snet_ap_aks_prefix = "10.6.0.0/20"
snet_ap_db_name = "snet-ap-hml-db"
snet_ap_db_prefix = "10.5.0.0/24"
pip_agw_ap_001_name = "pip-agw-ap-hml-001"