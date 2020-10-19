variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "location" {
  type        = string
  description = "Azure location to deploy resources"
}

resource "azurerm_resource_group" "newwebsite" {
  name     = "${var.environment}-newwebsite-rg"
  location = var.location
}

resource "azurerm_app_service_plan" "newwebsite" {
  name                = "newwebsite-appserviceplan"
  location            = azurerm_resource_group.newwebsite.location
  resource_group_name = azurerm_resource_group.newwebsite.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "newwebsite" {
  name                = "newwebsite-app-service"
  location            = azurerm_resource_group.newwebsite.location
  resource_group_name = azurerm_resource_group.newwebsite.name
  app_service_plan_id = azurerm_app_service_plan.newwebsite.id
}
