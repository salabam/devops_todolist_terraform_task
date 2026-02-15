resource "azurerm_storage_account" "st" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "cnt" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}