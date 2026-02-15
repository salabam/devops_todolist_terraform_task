output "public_ip_address" {
  value = module.network_module.public_ip_address
}

output "public_ip_fqdn" {
  value = module.network_module.public_ip_fqdn
}

output "vm_id" {
  value = module.compute_module.vm_id
}