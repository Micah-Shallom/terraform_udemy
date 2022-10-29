terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name = "nginx:1.23.2-alpine"
}

resource "random_string" "random1" {
    length           = 16
    special          = false
    upper = false
}

resource "docker_container" "nginx_container1"{
    name = join("-",["nginx", random_string.random1.result])
    image = docker_image.nginx_image.latest
    ports {
      internal = 80
      # external = 8000
    }
}


# output "nginx-url1" {
#     value = join(":", [docker_container.nginx_container1.ip_address, docker_container.nginx_container1.ports[0].external])
# }
# output "nginx-url2" {
#     value = join(":", [docker_container.nginx_container2.ip_address, docker_container.nginx_container2.ports[0].external])
# }
