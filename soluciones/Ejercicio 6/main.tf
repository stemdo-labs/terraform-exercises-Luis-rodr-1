module "uve_net" {
    source = "git@github.com:hashicorp/example.git@Ejercicio05"
    vnet_name = var.vnet_name
    owner_tag = "a"
    vnet_address_space = ""
    environment_tag = var.environment_tag
    existent_resource_group_name = var.existent_resource_group_name

}

resource "azurerm_subnet" "name" {
  name = "subred"
  resource_group_name = var.existent_resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes = [  ]
}

