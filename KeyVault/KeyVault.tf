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

provider "azurerm" {
  version = "~> 2.0.0"
  features {}
}

################################
# VARIABLES
################################
variable "resource_group_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

################################
# DATA SOURCES
################################
data "azurerm_resource_group" "example" {
  name                = var.resource_group_name
}

resource "azurerm_key_vault" "example" {
  name                        = var.keyvault_name
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  sku_name = "standard"
}