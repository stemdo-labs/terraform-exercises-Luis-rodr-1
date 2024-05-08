provider "azurerm"{
    features {
      
    }
}

resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    resource_group_name = var.existent_resource_group_name
    location = var.location
    address_space = var.vnet_address_space
    for_each = var.vnet_tags

    tags = merge(
        var.vnet_tags, 
        {   
            owner = var.owner_tag, 
            environment = var.environment_tag
        }
    )
    
}

locals{
  environment = var.environment_tag
  owner = var.owner_tag
}

