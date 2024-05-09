terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm"{
    features {}
} 

module "uve_net" {
    source = "./modules/Ejercicio 4"
    vnet_name = var.vnet_name
    owner_tag = var.owner_tag
    vnet_address_space = var.vnet_address_space
    environment_tag = var.environment_tag
    existent_resource_group_name = var.existent_resource_group_name

}

resource "azurerm_subnet" "subnet_test" {
  depends_on = [ module.uve_net ]
  name = "subred"
  resource_group_name = var.existent_resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes = [ "10.0.1.0/24" ]
}

