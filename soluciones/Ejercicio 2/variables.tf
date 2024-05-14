variable "existent_resource_group_name" {
    type = string
    nullable = false
}
variable "vnet_name" {
    type = string
    nullable = false
}
variable "vnet_address_space" {
    type = tuple([ string ])
    nullable = false
}

variable "location" {
    type = string
    default = "West Europe"
}