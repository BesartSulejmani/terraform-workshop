# Recommended using the required_providers block to set the
# Azure Provider source and version being used
terraform {
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

# Create app service plan
resource "azurerm_app_service_plan" "myappplan" {
  name                = "tf-workshop-plan01"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Create azure app service
resource "azurerm_app_service" "myappservice" {
  name                = "tf-workshop-app01"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  app_service_plan_id = azurerm_app_service_plan.myappplan.id

  site_config {
    dotnet_framework_version = "v5.0"
  }

  # storage_account {
  #   name = "MyAppStorageMount"
  #   type = "AzureBlob"
  #   account_name = data.azurerm_storage_account.tfstatestorage.name
  #   share_name = "containerformyapp"
  #   access_key = data.azurerm_storage_account.tfstatestorage.primary_access_key
  # }

  depends_on = [
    azurerm_app_service_plan.myappplan
  ]
}

# Get info on storage account tfstatebesart
data "azurerm_storage_account" "tfstatestorage" {
  name = "tfstatebesart"
  resource_group_name = "tfstate-rg"
}

# Output storage account tier to illustrate use of a data source
output "tfstatebesart_tier" {
  value = data.azurerm_storage_account.tfstatestorage.account_tier
}