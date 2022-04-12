# Recommended using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatebesart01"
    container_name       = "tfstate"
    key                  = "workshop.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.97.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "myrg" {
  name     = "tf-workshop-rg"
  location = "westeurope"
}

# Create app plan and app service of kind linux
module "myappservice" {
  source = "./myapp"

  rglocation = azurerm_resource_group.myrg.location
  rgname = azurerm_resource_group.myrg.name
}