terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "storage_module" {
  source                 = "./modules/storage"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.location
}

module "network_module" {
  source                  = "./modules/network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  virtual_network_name    = var.virtual_network_name
  vnet_address_prefix     = var.vnet_address_prefix
  sub_network_name        = var.sub_network_name
  subnet_address_prefix   = var.subnet_address_prefix
  net_security_group_name = var.net_security_group_name
  public_ip_name          = var.public_ip_name
  dns_prefix              = var.dns_prefix
}

module "compute_module" {
  source                       = "./modules/compute"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  subnet_id                    = module.network_module.subnet_id
  public_ip_id                 = module.network_module.public_ip_id
  network_interface_name_sufix = var.network_interface_name_sufix
  vm_name                      = var.vm_name
  vm_size                      = var.vm_size
  admin_username               = var.admin_username
  ssh_public_key               = var.ssh_public_key
  install_app_sh_git_path      = var.install_app_sh_git_path
  depends_on                   = [module.network_module]
}