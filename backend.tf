terraform {
  backend "azurerm" {
    resource_group_name  = "prod-rg"
    storage_account_name = "aksbhavya15"
    container_name       = "maale-123"
    key                  = "prod.terraform.tfstate"
  }
}

