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