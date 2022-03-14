# Recommended using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "2.97.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "myRG" {
  name = "tf-workshop-rg"
  location = "westeurope"
}