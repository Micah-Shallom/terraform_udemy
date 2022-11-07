variable "ext_port" {
    type = number
    default = 8000

    validation  {
        condition = var.ext_port > 0  && var.ext_port <= 65535
        error_message = "The external port must fall between the range of 0 - 65535."
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
variable "container_count" {
    type = number
    default = 2
}