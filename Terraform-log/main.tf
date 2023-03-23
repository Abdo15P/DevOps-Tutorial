terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
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
    key                  = "la-terraform.tfstate"
  }
}

data "azurerm_resource_group" "rg" {
  name = "${var.name}-rg"
}

resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = "${var.name}-la"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "la_solutions" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.la_workspace.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.la_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.la_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}