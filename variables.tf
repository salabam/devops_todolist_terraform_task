variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for all resources."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The list of prefixes"
  type        = list(string)
}

variable "sub_network_name" {
  description = "The name of the sub network"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The list of prefixes"
  type        = list(string)
}

variable "public_ip_name" {
  description = "The name of the public ip address"
  type        = string
}

variable "dns_prefix" {
  description = "The prefix for the dns label, will be concatenated with random number between 1000 and 9999"
  type        = string
}

variable "net_security_group_name" {
  description = "The name of the network security group"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "network_interface_name_sufix" {
  description = "The sufix of the network interface, will be concatenated with vm_name"
  type        = string
}

variable "admin_username" {
  description = "The user that will be created when the virtual machine is created"
  type        = string
}

variable "ssh_public_key" {
  type = string
}

variable "install_app_sh_git_path" {
  description = "The path to the git repo with install script"
  type        = string
}