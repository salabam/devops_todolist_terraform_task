output "public_ip_fqdn" {
  value = azurerm_public_ip.pip.fqdn
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "public_ip_id" {
  value = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}
