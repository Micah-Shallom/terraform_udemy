# ### splat allows one to target multiple resource in a resource group and display its output
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
#     count = var.container_count
#     name = join("-",["nginx", random_string.random[count.index].result])
#     image = docker_image.nginx_image.latest
#     ports {
#       internal = var.int_port
#       external = var.ext_port
#     }
# }

