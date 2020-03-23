# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  tenant_id = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
  client_id = var.azure_client_id
  client_secrete = var.azure_secret
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
resource "azurestack_resource_group" "test" {
  name     = var.resource_group_name
  location = var.resource_group_location
}