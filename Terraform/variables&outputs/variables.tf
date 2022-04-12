# Create variables
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
  description = "Set the VNet name"
  default = "tf-workshop-vnet01"
}

variable "vmprotection" {
  type = bool
  default = false
}

variable "vnetaddress" {
  type = list(string)
  default = [ "10.0.0.0/16", "10.1.0.0/16" ]
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