variable "env" {
    type = string
    description = "Env to deploy to"
    default = "dev"
}

variable "image" {
    type = map
    description = "image for environment deployment"
    default = {
        dev = "nginx:latest"
        prod = "nginx:1.23.2-alpine"
    }
}


variable "ext_port" {
    # type = list
    type = map

    validation  {
        condition = max(var.ext_port["dev"]...) > 0 && min(var.ext_port["dev"]...) <= 1999
        error_message = "The external port must fall between the range of 0 - 1999."
    }
    validation  {
        condition = max(var.ext_port["prod"]...) > 1999 && min(var.ext_port["prod"]...) <= 65535
        error_message = "The external port must fall between the range of 1999 - 65535."
    }
}

variable "int_port" {
    type = number
    default = 80

    validation {
        condition = var.int_port == 80
        error_message = "The internal port must be port 80."
    }
}
# variable "container_count" {
#     type = number
#     default = 2
# }

locals {
#   container_count = length(var.ext_port)
    container_count = length(lookup(var.ext_port,var.env))
}