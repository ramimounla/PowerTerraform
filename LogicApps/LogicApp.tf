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

variable "workflow_name" {
  type = string
}

################################
# DATA SOURCES
################################

data "azurerm_resource_group" "resource_group" {
  name                = var.resource_group_name
}

################################
# RESOURCES
################################
resource "azurerm_logic_app_workflow" "example" {
  name                = var.workflow_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  tags = {
    source = "terraform"
  }
}