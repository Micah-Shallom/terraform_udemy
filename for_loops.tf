# ### splat allows one to target multiple resource in a resource group and display its output

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

# resource "random_string" "random" {
#     count            = 2
#     length           = 16
#     special          = false
#     upper            = false
# }

# resource "docker_container" "nginx_container"{
#     count = 2
#     name = join("-",["nginx", random_string.random[count.index].result])
#     image = docker_image.nginx_image.latest
#     ports {
#       internal = 80
#       # external = 8000
#     }
# }

# output "nginx_container_names" {
#     value = [for i in docker_container.nginx_container[*] : join(":" , [i.ip_address],i.ports[*]["external"])]

# }

# # output
# ###################################################################################
# # nginx_container_names = [
# #   "172.17.0.5:49158",
# #   "172.17.0.4:49157",
# # ]
