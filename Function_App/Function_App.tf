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

variable "keyvault" {
  type = string
}

variable "storage_account_name" {
  type    = string
}

variable "app_service_plan_name" {
  type    = string
}

variable "function_name" {
  type = string
}

################################
# DATA SOURCES
################################
data "azurerm_resource_group" "resource_group" {
  name                = var.resource_group_name
}

data "azurerm_key_vault" "vault" {
  name                = var.keyvault
  resource_group_name = var.resource_group_name
}

################################
# RESOURCES
################################
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.resource_group.name
  location                 = data.azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "example" {
  name                      = var.function_name
  location                  = data.azurerm_resource_group.resource_group.location
  resource_group_name       = data.azurerm_resource_group.resource_group.name
  app_service_plan_id       = azurerm_app_service_plan.example.id
  storage_connection_string = azurerm_storage_account.example.primary_connection_string
}

resource "azurerm_key_vault_access_policy" "item" {
  key_vault_id    = data.azurerm_key_vault.vault.id
  tenant_id       = azurerm_function_app.example.identity.0.tenant_id
  object_id       = azurerm_function_app.example.identity.0.principal_id

  secret_permissions = [
    "get",
  ]
}