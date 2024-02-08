
provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}

resource "azurerm_resource_group" "name_reference" {
  
  name="MyFirstResourceGroup"
  location = "westeurope"

}