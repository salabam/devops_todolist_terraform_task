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

variable "subnet_id" {
  description = "The id of the sub network"
  type        = string
}

variable "public_ip_id" {
  description = "The id of the public ip address"
  type        = string
}

variable "admin_username" {
  description = "The user that will be created when the virtual machine is created"
  type        = string
}

variable "ssh_public_key" {
  description = "The path to the ssh key for sign in to system"
  type        = string
}

variable "install_app_sh_git_path" {
  description = "The path to the git repo with install script"
  type        = string
}