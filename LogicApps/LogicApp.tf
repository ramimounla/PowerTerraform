#############################################################################
# VARIABLES
#############################################################################
variable "resource_group_name" {
  type = string
}

variable "workflow_name" {
  type = string
}


data "azurerm_resource_group" "resource_group" {
  name                = var.resource_group_name
}

resource "azurerm_logic_app_workflow" "example" {
  name                = var.workflow_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  tags = {
    source = "terraform"
  }
}