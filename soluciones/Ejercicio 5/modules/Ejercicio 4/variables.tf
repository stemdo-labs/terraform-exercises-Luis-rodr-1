variable "existent_resource_group_name" {
    type = string
}
variable "vnet_name" {
    type = string
    nullable = false
    validation {
        condition = length(regex("^vnet[a-z]{3,}tfexercise[0-9]{2,}$", var.vnet_name)) > 0
        error_message = "Debe cumplirse que comience por vnet seguido de más de dos caracteres en el rango [a-z], \ny que termine por tfexercise seguido de al menos dos dígitos numéricos. "
    }
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
    validation {
        condition = length(var.owner_tag) > 0
        error_message = "El valor owner_tag no puede estar vacío"
    }
    description = "Describe el propietario de la Red Virtual"
}

variable "environment_tag" {
  type = string
  description = "Describe el entorno de la VNet (`dev`, `test`, `prod`, etc)."
  nullable = false
  validation {
        #condition = length([for booleanValue in [ for item in ["DEV", "PRO", "TES", "PRE"]:contains(upper(var.environment_tag), item) ] : booleanValue if booleanValue == true]) == 1
        condition = length(regexall("DEV|PRO|TES|PRE", upper(var.environment_tag))) == 1 ## Alternativa con regexal
        error_message = "El valor environment_tag no puede estar vacío"
    }
}

variable "vnet_tags" {
  type = map(string)
  default = {}
  description = "Describe los tags adicionales que se aplicarán a la VNet."
  validation {
    condition = !contains( length(var.vnet_tags) > 0 ? [ for key, value in var.vnet_tags: key == null || length(key)<=0 || value == null || length(value) <= 0  ]: [false], true )
    error_message = "No debe ser ni contener nulo ni cadenas vacías"
  }
}