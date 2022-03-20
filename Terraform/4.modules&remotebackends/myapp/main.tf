variable "rgname" {
  type = string
}

variable "rglocation" {
  type = string
}

# Create app service plan
resource "azurerm_app_service_plan" "myappplan" {
  name                = "tf-workshop-plan01"
  location            = var.rglocation
  resource_group_name = var.rgname
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
  location            = var.rglocation
  resource_group_name = var.rgname
  app_service_plan_id = azurerm_app_service_plan.myappplan.id

  site_config {
    dotnet_framework_version = "v5.0"
  }
  
}