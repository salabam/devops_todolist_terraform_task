resource "azurerm_network_interface" "ni" {
  name                = "${var.vm_name}${var.network_interface_name_sufix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "ip-cfg"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [azurerm_network_interface.ni.id]
  size                            = var.vm_size
  admin_username                  = var.admin_username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}

resource "azurerm_virtual_machine_extension" "install_script" {
  name                 = "install-app-extension"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    fileUris = [
      var.install_app_sh_git_path
    ],
    commandToExecute = "bash install-app.sh"
  })
}

