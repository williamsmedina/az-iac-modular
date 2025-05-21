provider "azurerm" {
  features {}
}

# environments/dev/main.tf
module "storage" {
  source              = "../../modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dev"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
