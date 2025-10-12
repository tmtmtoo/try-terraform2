terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.1"
    }
  }
}

resource "docker_image" "nginx" {
  name = format("nginx:%s", var.nginx_image_tag)
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name = var.container_name
  ports {
    internal = 80
    external = var.container_extern_port
  }
}
