### splat allows one to target multiple resource in a resource group and display its output
provider "docker" {}

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

resource "docker_image" "nginx_image" {
  name = "nginx:1.23.2-alpine"
}

resource "random_string" "random" {
    count            = 2
    length           = 16
    special          = false
    upper            = false
}

resource "docker_container" "nginx_container"{
    count = var.container_count
    name = join("-",["nginx", random_string.random[count.index].result])
    image = docker_image.nginx_image.latest
    ports {
      internal = var.int_port
      external = var.ext_port
    }
}

output "nginx_container_names" {
    value = [for i in docker_container.nginx_container[*] : join(":" , [i.ip_address],i.ports[*]["external"])]

}

# output
###################################################################################
# nginx_container_names = [
#   "172.17.0.5:49158",
#   "172.17.0.4:49157",
# ]
