output "nginx_container_names" {
    value = [for i in docker_container.nginx_container[*] : join(":" , [i.ip_address],i.ports[*]["external"])]

}


# output
###################################################################################
# nginx_container_names = [
#   "172.17.0.5:49158",
#   "172.17.0.4:49157",
# ]