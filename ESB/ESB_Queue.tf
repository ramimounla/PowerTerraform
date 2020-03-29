provider "azurerm" {
  version = "~> 2.1.0"
  features {}
}

################################
# VARIABLES
################################
variable "resource_group_name" {
  type = string
}

variable "service_bus_namespace" {
  type    = string
}

variable "queue_name" {
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
resource "azurerm_servicebus_namespace" "servicebus" {
  name                = var.service_bus_namespace
  location            = data.azurerm_resource_group.resource_group.location  
  resource_group_name = data.azurerm_resource_group.resource_group.name
  sku                 = "Basic"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_queue" "queue" {
  name                = var.queue_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
  namespace_name      = azurerm_servicebus_namespace.servicebus.name

  enable_partitioning = false
  dead_lettering_on_message_expiration = true
}