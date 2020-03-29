# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.1.0"
  features {}
}

################################
# VARIABLES
################################
variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

################################
# RESOURCES
################################
resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.resource_group_location
}