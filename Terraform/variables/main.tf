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

# Variables
variable "location" {
  type = string
  default = "westeurope"
}

variable "rgname" {
  type = string
  default = "tf-workshop-rg"
}

variable "vnetname" {
  type = string
  default = "tf-workshop-vnet01"
}

variable "vmprotection" {
  default = true
}

variable "vnetaddress" {
  type = list(string)
  default = ["10.0.0.0/16", "10.1.0.0/16"]
}

variable "subnetmap" {
  type = map
  default = {
      subnet01_name = "subnet01"
      subnet01_prefix = "10.0.0.0/24"
      subnet02_name = "subnet02"
      subnet02_prefix = "10.1.0.0/24"
  }
}

# Create resource group
resource "azurerm_resource_group" "myrg" {
  name = var.rgname
  location = var.location
}

# Create virtual network
resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnetname
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.vnetaddress
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