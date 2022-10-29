# terraform {
#   required_providers {
#     docker = {
#       source  = "kreuzwerker/docker"
#       version = "2.22.0"
#     }
#   }
# }

# provider "docker" {}

# resource "docker_image" "nginx_image" {
#   name = "nginx:1.23.2-alpine"
# }
# resource "docker_container" "nginx_container"{
#     name = "nginx_container"
#     image = docker_image.nginx_image.latest
#     ports {
#       internal = 80
#       external = 8000
#     }
# }

# output "nginx-url" {
#     value = join(":", [docker_container.nginx_container.ip_address, docker_container.nginx_container.ports[0].external])
# }
# # output "nginx-IP" {
# #     description = "IP address of the Nginx Container"
# #     value = docker_container.nginx_container.ip_address
# # }

# # output "nginx_container_port" {
# #     value = docker_container.nginx_container.ports[0].external
# # }