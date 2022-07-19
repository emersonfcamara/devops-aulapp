##############################################################################
# * HashiCorp Beginner's Guide to Using Terraform on Azure
# 
# This Terraform configuration will create the following:
#
# Resource group with a virtual network and subnet
# An Ubuntu Linux server running Apache

##############################################################################
# * Shared infrastructure resources

# The latest version of the Azure provider breaks backward compatibility.
# TODO: Update this code to use the latest provider.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.10.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "stcloudshellusers"
    container_name       = "tfstate"
    key                  = "hlg-terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# First we'll create a resource group. In Azure every resource belongs to a 
# resource group. Think of it as a container to hold all your resources. 
# You can find a complete list of Azure resources supported by Terraform here:
# https://www.terraform.io/docs/providers/azurerm/

# resource group section
resource "azurerm_resource_group" "rg_infra" {
  name     = "${var.resource_group_rg_infra}"
  location = "${var.location}"
}

resource "azurerm_resource_group" "rg_application" {
  name     = "${var.resource_group_rg_application}"
  location = "${var.location}"
}

resource "azurerm_resource_group" "rg_cache" {
  name     = "${var.resource_group_rg_cache}"
  location = "${var.location}"
}

resource "azurerm_resource_group" "rg_security" {
  name     = "${var.resource_group_rg_security}"
  location = "${var.location}"
}

resource "azurerm_resource_group" "rg_database" {
  name     = "${var.resource_group_rg_database}"
  location = "${var.location}"
}

resource "azurerm_resource_group" "rg_queue" {
  name     = "${var.resource_group_rg_queue}"
  location = "${var.location}"
}

# end section of resource group

# The next resource is a Virtual Network. We can dynamically place it into the
# resource group without knowing its name ahead of time. Terraform handles all
# of that for you, so everything is named consistently every time. Say goodbye
# to weirdly-named mystery resources in your Azure Portal. To see how all this
# works visually, run `terraform graph` and copy the output into the online
# GraphViz tool: http://www.webgraphviz.com/

# network section
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.virtual_network_name}"
  location            = "${azurerm_resource_group.rg_infra.location}"
  address_space       = "${var.network_address_space}"
  resource_group_name = "${azurerm_resource_group.rg_infra.name}"

  depends_on = [
    azurerm_resource_group.rg_infra
  ]
}

# Next we'll build a subnet to run our VMs in. These variables can be defined 
# via environment variables, a config file, or command line flags. Default 
# values will be used if the user does not override them. You can find all the
# default variables in the variables.tf file. You can customize this demo by
# making a copy of the terraform.tfvars.example file.
resource "azurerm_subnet" "snet_ap_agw" {
  name                 = "${var.snet_ap_agw_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg_infra.name}"
  address_prefixes     = ["${var.snet_ap_agw_prefix}"]

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "snet_ap_aks" {
  name                 = "${var.snet_ap_aks_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg_infra.name}"
  address_prefixes     = ["${var.snet_ap_aks_prefix}"]

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "snet_ap_db" {
  name                 = "${var.snet_ap_db_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg_infra.name}"
  address_prefixes     = ["${var.snet_ap_db_prefix}"]

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_virtual_network.vnet
  ]
}

# Every Azure Virtual Machine comes with a private IP address. You can also 
# optionally add a public IP address for Internet-facing applications and 
# demo environments like this one.
resource "azurerm_public_ip" "pip_agw_ap_001" {
  name                         = "${var.pip_agw_ap_001_name}"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.rg_infra.name}"
  allocation_method            = "${var.pip_agw_ap_001_allocation_method}"
  sku                          = "${var.pip_agw_ap_001_sku}"

  depends_on = [
    azurerm_resource_group.rg_infra
  ]
}

resource "azurerm_storage_account" "stamedia" {
  name                     = "${var.stamedia_name}"
  resource_group_name      = "${azurerm_resource_group.rg_infra.name}"
  location                 = "${var.location}"
  account_tier             = "${var.stamedia_tier}"
  account_replication_type = "${var.stamedia_replica_type}"

  depends_on = [
    azurerm_resource_group.rg_infra
  ]
}

resource "azurerm_storage_account" "staspa" {
  name                     = "${var.staspa_name}"
  resource_group_name      = "${azurerm_resource_group.rg_infra.name}"
  location                 = "${var.location}"
  account_tier             = "${var.staspa_tier}"
  account_replication_type = "${var.staspa_replica_type}"

  depends_on = [
    azurerm_resource_group.rg_infra
  ]
}

# Azure Front Door

resource "azurerm_frontdoor" "fd_aulapp" {
  name                = "${var.fd_aulapp_name}"
  resource_group_name = "${azurerm_resource_group.rg_infra.name}"

  routing_rule {
    name               = "${var.fd_aulapp_rr_name}"
    accepted_protocols = "${var.fd_aulapp_rr_ap}"
    patterns_to_match  = "${var.fd_aulapp_rr_patterns}"
    frontend_endpoints = ["${var.fd_aulapp_name}"]
    forwarding_configuration {
      forwarding_protocol = "${var.fd_aulapp_rr_fc_fp}"
      backend_pool_name   = "${var.fd_aulapp_bp_name}"
    }
  }

  backend_pool_settings {
    backend_pools_send_receive_timeout_seconds   = 0
    enforce_backend_pools_certificate_name_check = false
  }

  backend_pool_load_balancing {
    name = "${var.fd_aulapp_bplb}"
  }

  backend_pool_health_probe {
    name = "${var.fd_aulapp_bphp}"
  }

  backend_pool {
    name = "${var.fd_aulapp_bp_name}"
    backend {
      host_header = "${var.fd_aulapp_bp_bhh}"
      address     = "${var.fd_aulapp_bp_ba}"
      http_port   = "${var.fd_aulapp_bp_bhttp}"
      https_port  = "${var.fd_aulapp_bp_bhttps}"
    }

    load_balancing_name = "${var.fd_aulapp_bplb}"
    health_probe_name   = "${var.fd_aulapp_bphp}"
  }

  frontend_endpoint {
    name      = "${var.fd_aulapp_name}"
    host_name = "${var.fd_aulapp_name}.azurefd.net"
  }

  depends_on = [
    azurerm_resource_group.rg_infra
  ]
}

# end of Azure Front Door

resource "azurerm_application_gateway" "agw_ap_001" {
  name                = "${var.agw_ap_001_name}"
  resource_group_name = "${azurerm_resource_group.rg_infra.name}"
  location            = "${var.location}"

  sku {
    name     = "${var.agw_ap_001_sku}"
    tier     = "${var.agw_ap_001_sku_tier}"
    capacity = "${var.agw_ap_001_capacity}"
  }

  gateway_ip_configuration {
    name      = "${var.agw_ap_001_ip_conf}"
    subnet_id = "${azurerm_subnet.snet_ap_agw.id}"
  }

  frontend_port {
    name = "${var.agw_ap_001_fp_name}"
    port = "${var.agw_ap_001_fp_number}"
  }

  frontend_ip_configuration {
    name                 = "${var.agw_ap_001_fp_ip_name}"
    public_ip_address_id = azurerm_public_ip.pip_agw_ap_001.id
  }

  backend_address_pool {
    name = "${var.agw_ap_001_bap_name}"
  }

  backend_http_settings {
    name                  = "${var.agw_ap_001_bhs_name}"
    cookie_based_affinity = "${var.agw_ap_001_bhs_cba}"
    path                  = "${var.agw_ap_001_bhs_path}"
    port                  = "${var.agw_ap_001_bhs_port}"
    protocol              = "${var.agw_ap_001_bhs_protocol}"
    request_timeout       = "${var.agw_ap_001_bhs_rt}"
  }

  http_listener {
    name                           = "${var.agw_ap_001_hl_name}"
    frontend_ip_configuration_name = "${var.agw_ap_001_fp_ip_name}"
    frontend_port_name             = "${var.agw_ap_001_fp_name}"
    protocol                       = "${var.agw_ap_001_hl_protocol}"
  }

  request_routing_rule {
    name                       = "${var.agw_ap_001_rrr_name}"
    rule_type                  = "${var.agw_ap_001_rrr_rule_type}"
    http_listener_name         = "${var.agw_ap_001_hl_name}"
    backend_address_pool_name  = "${var.agw_ap_001_bap_name}"
    backend_http_settings_name = "${var.agw_ap_001_bhs_name}"
    priority                   = "${var.agw_ap_001_rrr_priority}"
  }

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_subnet.snet_ap_agw,
    azurerm_public_ip.pip_agw_ap_001
  ]
}

# end of network section

# key vault section

resource "azurerm_key_vault" "kv_ap_001" {
  name                        = "${var.kv_ap_001_name}"
  location                    = "${var.location}"
  resource_group_name         = "${azurerm_resource_group.rg_security.name}"
  enabled_for_disk_encryption = "${var.kv_ap_001_disk_encryption}"
  tenant_id                   = "${var.kv_ap_001_tenant_id}"
  soft_delete_retention_days  = "${var.kv_ap_001_retention}"
  purge_protection_enabled    = "${var.kv_ap_001_protection_enabled}"

  sku_name = "${var.kv_ap_001_sku}"

  depends_on = [
    azurerm_resource_group.rg_security
  ]
}

# end of section key vault

# microsoft cdn section

resource "azurerm_cdn_profile" "cdnp_001" {
  name                = "${var.cdnp_001_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg_cache.name}"
  sku                 = "${var.cdnp_001_sku}"

  depends_on = [
    azurerm_resource_group.rg_security
  ]
}

# end of microsoft cdn section

# mysql section

resource "azurerm_mysql_server" "mysql_001" {
  name                = "${var.mysql_001_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg_database.name}"

  administrator_login          = "${var.mysql_001_admin_login}"
  administrator_login_password = "${var.mysql_001_admin_password}"

  sku_name   = "${var.mysql_001_sku}"
  storage_mb = "${var.mysql_001_storage_mb}"
  version    = "${var.mysql_001_version}"

  geo_redundant_backup_enabled      = "${var.mysql_001_back_geo}"
  ssl_enforcement_enabled           = "${var.mysql_001_ssl_enabled}"
  ssl_minimal_tls_version_enforced  = "${var.mysql_001_tls_version}"

  depends_on = [
    azurerm_resource_group.rg_security
  ]
}

# MySQL Firewall rule to permit connection from all Azure Services
resource "azurerm_mysql_firewall_rule" "mysql_001_azuresvc" {
  name                = "${var.mysql_001_fwr_azuresvc_name}"
  resource_group_name = "${azurerm_resource_group.rg_database.name}"
  server_name         = azurerm_mysql_server.mysql_001.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# end o mysql section

# private endpoint section

resource "azurerm_private_endpoint" "pep_mysql_001" {
  name                = "${var.pep_mysql_001_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg_database.name}"
  subnet_id           = "${azurerm_subnet.snet_ap_db.id}"

  private_service_connection {
    name                           = "${var.pep_mysql_001_service_name}"
    private_connection_resource_id = "${azurerm_mysql_server.mysql_001.id}"
    subresource_names              = "${var.pep_mysql_001_subresource_name}"
    is_manual_connection           = "${var.pep_mysql_001_ismc}"
  }

  private_dns_zone_group{
    name                 = "${var.pep_mysql_001_pdzg_name}"
    private_dns_zone_ids = ["${azurerm_private_dns_zone.pdnsz_001.id}"]
  }

  depends_on = [
    azurerm_resource_group.rg_database,
    azurerm_mysql_server.mysql_001,
    azurerm_subnet.snet_ap_db,
    azurerm_private_dns_zone.pdnsz_001
  ]
}

# end of private endpoint section

# private dns section

resource "azurerm_private_dns_zone" "pdnsz_001" {
  name                = "${var.pdnsz_001_name}"
  resource_group_name = "${azurerm_resource_group.rg_infra.name}"

  depends_on = [
    azurerm_resource_group.rg_infra
  ]
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdnsz_vnet_001" {
  name                  = "${var.pdnsz_vnet_001_name}"
  resource_group_name   = "${azurerm_resource_group.rg_infra.name}"
  private_dns_zone_name = "${azurerm_private_dns_zone.pdnsz_001.name}"
  virtual_network_id    = "${azurerm_virtual_network.vnet.id}"
  registration_enabled  = "${var.pdnsz_vnet_001_re}"

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_private_dns_zone.pdnsz_001,
    azurerm_virtual_network.vnet
  ]
}

# end of private dns section

# user assigned identity section

resource "azurerm_user_assigned_identity" "aks_ap_001_id" {
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  name = "${var.aks_ap_001_id_name}"

  depends_on = [
    azurerm_resource_group.rg_application
  ]
}

# end of user assigned identity section

# application insights section

resource "azurerm_application_insights" "appi_ap_001" {
  name                = "${var.appi_ap_001_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  application_type    = "${var.appi_ap_001_type}"

  depends_on = [
    azurerm_resource_group.rg_application
  ]
}

resource "azurerm_monitor_action_group" "acg_ap_001" {
  name                = "${var.acg_ap_001_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  short_name          = "${var.acg_ap_001_short_name}"

  depends_on = [
    azurerm_resource_group.rg_application
  ]
}

resource "azurerm_monitor_smart_detector_alert_rule" "sdar_app_001" {
  name                = "${var.sdar_app_001_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  severity            = "${var.sdar_app_001_severity}"
  scope_resource_ids  = [azurerm_application_insights.appi_ap_001.id]
  frequency           = "${var.sdar_app_001_frequency}"
  detector_type       = "${var.sdar_app_001_detector_type}"

  action_group {
    ids = [azurerm_monitor_action_group.acg_ap_001.id]
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_monitor_action_group.acg_ap_001,
    azurerm_application_insights.appi_ap_001
  ]
}

# end of application insights section

# kubernetes section

resource "azurerm_kubernetes_cluster" "aks_ap_001" {
  name                = "${var.aks_ap_001_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  dns_prefix          = "${var.aks_ap_001_dns_prefix}"
  kubernetes_version  = "${var.aks_ap_001_version}"
  

  default_node_pool {
    name           = "${var.aks_ap_001_npn}"
    node_count     = "${var.aks_ap_001_nc}"
    vm_size        = "${var.aks_ap_001_vm_size}"
    vnet_subnet_id = "${azurerm_subnet.snet_ap_aks.id}"
  }

  identity {
    type         = "${var.aks_ap_001_identity_type}"
    identity_ids = ["${azurerm_user_assigned_identity.aks_ap_001_id.id}"]
  }

  ingress_application_gateway {
    gateway_id = "${azurerm_application_gateway.agw_ap_001.id}"
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_application_insights.appi_ap_001,
    azurerm_user_assigned_identity.aks_ap_001_id,
    azurerm_subnet.snet_ap_aks,
    azurerm_application_gateway.agw_ap_001
  ]
}

# end of kubernenetes section

# azure function app section

resource "azurerm_storage_account" "st_function_001" {
  name                     = "${var.st_function_001_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_001_tier}"
  account_replication_type = "${var.st_function_001_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_service_plan" "app_service_plan_001" {
  name                = "${var.app_service_plan_001_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"
  os_type             = "${var.app_service_plan_001_os_type}"
  sku_name            = "${var.app_service_plan_001_sku}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_001" {
  name                = "${var.func_app_001_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_001.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      python_version = "${var.func_app_001_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_001,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}

resource "azurerm_storage_account" "st_function_002" {
  name                     = "${var.st_function_002_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_002_tier}"
  account_replication_type = "${var.st_function_002_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_002" {
  name                = "${var.func_app_002_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_002.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      python_version = "${var.func_app_002_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_002,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}

resource "azurerm_storage_account" "st_function_003" {
  name                     = "${var.st_function_003_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_003_tier}"
  account_replication_type = "${var.st_function_003_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_003" {
  name                = "${var.func_app_003_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_003.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      python_version = "${var.func_app_003_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_003,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}

resource "azurerm_storage_account" "st_function_004" {
  name                     = "${var.st_function_004_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_004_tier}"
  account_replication_type = "${var.st_function_004_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_004" {
  name                = "${var.func_app_004_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_004.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      python_version = "${var.func_app_004_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_004,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}


resource "azurerm_storage_account" "st_function_005" {
  name                     = "${var.st_function_005_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_005_tier}"
  account_replication_type = "${var.st_function_005_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_005" {
  name                = "${var.func_app_005_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_005.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      python_version = "${var.func_app_005_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_005,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}

resource "azurerm_storage_account" "st_function_006" {
  name                     = "${var.st_function_006_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_006_tier}"
  account_replication_type = "${var.st_function_006_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_006" {
  name                = "${var.func_app_006_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_006.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      node_version = "${var.func_app_006_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_006,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}

resource "azurerm_storage_account" "st_function_007" {
  name                     = "${var.st_function_007_name}"
  resource_group_name      = "${azurerm_resource_group.rg_application.name}"
  location                 = "${var.location}"
  account_tier             = "${var.st_function_007_tier}"
  account_replication_type = "${var.st_function_007_repl_type}"

  depends_on = [
    azurerm_resource_group.rg_application,
  ]
}

resource "azurerm_linux_function_app" "func_app_007" {
  name                = "${var.func_app_007_name}"
  resource_group_name = "${azurerm_resource_group.rg_application.name}"
  location            = "${var.location}"

  storage_account_name = "${azurerm_storage_account.st_function_007.name}"
  service_plan_id      = "${azurerm_service_plan.app_service_plan_001.id}"

  site_config {
    application_insights_connection_string = "${azurerm_application_insights.appi_ap_001.connection_string}"

    application_stack{
      python_version = "${var.func_app_007_scas_version}"
    }
  }

  depends_on = [
    azurerm_resource_group.rg_application,
    azurerm_storage_account.st_function_007,
    azurerm_service_plan.app_service_plan_001,
    azurerm_application_insights.appi_ap_001
  ]
}
# end of azure function app

# service bus section

resource "azurerm_servicebus_namespace" "sb_ap_001" {
  name                = "${var.sb_ap_001_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg_queue.name}"
  sku                 = "${var.sb_ap_001_sku}"

  depends_on = [
    azurerm_resource_group.rg_queue
  ]
}

resource "azurerm_servicebus_queue" "sbs_enrich_uat" {
  name         = "${var.sbs_enrich_uat_name}"
  namespace_id = azurerm_servicebus_namespace.sb_ap_001.id

  enable_partitioning = "${var.sbs_enrich_uat_ep}"
  dead_lettering_on_message_expiration = "${var.sbs_enrich_uat_dlq}"
}

resource "azurerm_servicebus_queue" "sbs_file_integration_uat" {
  name         = "${var.sbs_file_integration_uat_name}"
  namespace_id = azurerm_servicebus_namespace.sb_ap_001.id

  enable_partitioning = "${var.sbs_file_integration_uat_ep}"
  dead_lettering_on_message_expiration = "${var.sbs_file_integration_uat_dlq}"
}

resource "azurerm_servicebus_queue" "sbs_magento_integration_uat" {
  name         = "${var.sbs_magento_integration_uat_name}"
  namespace_id = azurerm_servicebus_namespace.sb_ap_001.id

  enable_partitioning = "${var.sbs_magento_integration_uat_ep}"
  dead_lettering_on_message_expiration = "${var.sbs_magento_integration_uat_dlq}"
}

resource "azurerm_servicebus_queue" "sbs_notification_online_uat" {
  name         = "${var.sbs_notification_online_uat_name}"
  namespace_id = azurerm_servicebus_namespace.sb_ap_001.id

  enable_partitioning = "${var.sbs_notification_online_uat_ep}"
  dead_lettering_on_message_expiration = "${var.sbs_notification_online_uat_dlq}"
}

# end of service bus section
