### splat allows one to target multiple resource in a resource group and display its output
provider "docker" {}



resource "docker_image" "nginx_image" {
  name = lookup(var.image, terraform.workspace)
}

resource "random_string" "random" {
    count            = local.container_count
    length           = 16
    special          = false
    upper            = false
}

resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "mkdir nginxvol || true && chmod -R 755 nginxvol"
  }
}

resource "docker_container" "nginx_container"{
    count = local.container_count
    name = join("-",["nginx", terraform.workspace, random_string.random[count.index].result])
    image = docker_image.nginx_image.latest
    ports {
      internal = var.int_port
      external = lookup(var.ext_port,terraform.workspace)[count.index]
    }
    volumes {
      container_path = "/usr/share/nginx/html"
      host_path = "${path.cwd}/nginxvol"
    }
}

