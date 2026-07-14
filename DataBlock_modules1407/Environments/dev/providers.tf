terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "4.75.0"
        }
    }
    backend "azurerm" {
        resource_group_name  = "rg-dev"
        storage_account_name = "datamodulestorageaccount"
        container_name       = "newtfstatefilecontainer"
        key                  = "moduleterraform.tfstate"
    }
}

provider "azurerm" {
    features {}
}