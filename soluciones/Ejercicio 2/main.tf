provider "azurerm"{
    features {
      
    }
}

resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    resource_group_name = var.existent_resource_group_name
    location = var.location
    address_space = var.vnet_address_space
}

