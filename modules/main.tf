provider "azurerm" {
  version = "=2.20.0"
  features {}
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure location to deploy resources"
  default     = "norwayeast"
}

module "newwebsite" {
  source = "./newwebsite"

  environment = var.environment
  location    = var.location
}
