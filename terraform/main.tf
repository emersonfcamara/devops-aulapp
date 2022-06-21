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
    key                  = "hml-terraform.tfstate"
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
resource "azurerm_subnet" "snet_ap_hml_agw" {
  name                 = "${var.snet_ap_agw_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg_infra.name}"
  address_prefixes     = ["${var.snet_ap_agw_prefix}"]

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "snet_ap_hml_aks" {
  name                 = "${var.snet_ap_aks_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg_infra.name}"
  address_prefixes     = ["${var.snet_ap_aks_prefix}"]

  depends_on = [
    azurerm_resource_group.rg_infra,
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "snet_ap_hml_db" {
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
    frontend_endpoints = ["${var.fd_aulapp_fe_name}"]
    forwarding_configuration {
      forwarding_protocol = "${var.fd_aulapp_rr_fc_fp}"
      backend_pool_name   = "${var.fd_aulapp_bp_name}"
    }
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
    name      = "${var.fd_aulapp_fe_name}"
    host_name = "${var.fd_aulapp_fe_hn}"
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
    subnet_id = "${azurerm_subnet.snet_ap_hml_agw.id}"
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
}

# end of network section

##############################################################################
# * Azure MySQL Database

# Terraform can build any type of infrastructure, not just virtual machines. 
# Azure offers managed MySQL database servers and a whole host of other 
# resources. Each resource is documented with all the available settings:
# https://www.terraform.io/docs/providers/azurerm/r/mysql_server.html

# Uncomment the code below to add a MySQL server to your resource group.

# resource "azurerm_mysql_server" "mysql" {
#   name                = "${var.mysql_hostname}"
#   location            = "${azurerm_resource_group.tf_azure_guide.location}"
#   resource_group_name = "${azurerm_resource_group.tf_azure_guide.name}"
#   ssl_enforcement     = "Disabled"

#   sku {
#     name     = "MYSQLB50"
#     capacity = 50
#     tier     = "Basic"
#   }

#   administrator_login          = "mysqladmin"
#   administrator_login_password = "Everything-is-bananas-010101"
#   version                      = "5.7"
#   storage_mb                   = "51200"
#   ssl_enforcement              = "Disabled"
# }

# # This is a sample database that we'll populate with the MySQL sample data
# # set provided here: https://github.com/datacharmer/test_db. With Terraform,
# # everything is Infrastructure as Code. No more manual steps, aging runbooks,
# # tribal knowledge or outdated wiki instructions. Terraform is your executable
# # documentation, and it will build infrastructure correctly every time.
# resource "azurerm_mysql_database" "employees" {
#   name                = "employees"
#   resource_group_name = "${azurerm_resource_group.tf_azure_guide.name}"
#   server_name         = "${azurerm_mysql_server.mysql.name}"
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }

# # This firewall rule allows database connections from anywhere and is suited
# # for demo environments. Don't do this in production. 
# resource "azurerm_mysql_firewall_rule" "demo" {
#   name                = "tf-guide-demo"
#   resource_group_name = "${azurerm_resource_group.tf_azure_guide.name}"
#   server_name         = "${azurerm_mysql_server.mysql.name}"
#   start_ip_address    = "0.0.0.0"
#   end_ip_address      = "0.0.0.0"
# }