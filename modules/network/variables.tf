### I made sure that all variables are in terraform.tfvars
### I don't need you to write "check it!" to every variable.

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for all resources."
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

variable "subnet_name" {
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
