terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "devops-tut"
    storage_account_name = "devopstutstate"
    container_name       = "tf-state"
    key                  = "acr-terraform.tfstate"
  }
}

resource "azurerm_resource_group" "acr-rg" {
  name     = "${var.name}-rg"
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.name}acr"
  resource_group_name = azurerm_resource_group.acr-rg.name
  location            = azurerm_resource_group.acr-rg.location
  sku                 = "Standard"
  admin_enabled       = false
  
}
