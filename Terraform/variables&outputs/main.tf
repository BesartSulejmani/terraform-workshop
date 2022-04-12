terraform {
    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "2.97.0"
      }
    }
}

# Provider AzureRM
provider "azurerm" {
  features {}
}

# create a resource group
resource "azurerm_resource_group" "myrg" {
  name = var.rgname
  location = var.location
}

# create a virtual network
resource "azurerm_virtual_network" "myvnet" {
  name = var.vnetname
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space = var.vnetaddress
  vm_protection_enabled = var.vmprotection

  subnet {
      name = var.subnetmap["subnet01_name"]
      address_prefix = var.subnetmap["subnet01_prefix"]
  }

  subnet {
      name = var.subnetmap["subnet02_name"]
      address_prefix = var.subnetmap["subnet02_prefix"]
  }
}

output "vnetid" {
  value = azurerm_virtual_network.myvnet.id
}