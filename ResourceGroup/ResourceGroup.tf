# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.44.0"
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
resource "azurestack_resource_group" "test" {
  name     = var.resource_group_name
  location = var.resource_group_location
}