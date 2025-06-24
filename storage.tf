resource "azurerm_storage_account" "storage_account" {
  name                     = "aksbhavya15"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
  depends_on = [
    azurerm_resource_group.rg
  ]
}


resource "azurerm_storage_container" "storage_container" {
  name                  = "maale-123"
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}
