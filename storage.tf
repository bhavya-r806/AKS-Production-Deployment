resource "azurerm_storage_account" "storage_account" {
  name                     = "aksbhavya15"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "maale-123"
  storage_account_name  = azurerm_storage_account.storage_account.name
  resource_group_name   = var.resource_group_name
  container_access_type = "private"
}