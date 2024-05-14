variable "existent_resource_group_name" {
    type = string
}
variable "vnet_name" {
    type = string
}
variable "vnet_address_space" {
    type = tuple( [string] )
}

variable "location" {
    type = string
    default = "West Europe"
}

variable "owner_tag" {
    type = string
    nullable = false
    description = "Describe el propietario de la Red Virtual"
}

variable "environment_tag" {
  type = string
  description = "Describe el entorno de la VNet (`dev`, `test`, `prod`, etc)."
}

variable "vnet_tags" {
  type = map(string)
  default = {}
  description = "Describe los tags adicionales que se aplicarán a la VNet."
}