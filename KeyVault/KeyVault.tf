# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.1.0"
  features {}
}

################################
# VARIABLES
################################t
variable "resource_group_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "azure_tenant_id" {
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
  location                    = data.azurerm_resource_group.example.location
  resource_group_name         = data.azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.azure_tenant_id
  # soft_delete_enabled         = true
  # purge_protection_enabled    = false

  sku_name = "standard"
}