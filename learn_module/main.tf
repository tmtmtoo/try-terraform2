terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:${var.nginx_image_tag}"
  keep_locally = false
}

locals {
  nginx_instances = {
    nginx1 = { port = 9000 }
    nginx2 = { port = 9001 }
  }
}

module "nginx" {
  source   = "./modules/nginx"
  for_each = local.nginx_instances

  container_name        = each.key
  container_image_id    = docker_image.nginx.image_id
  container_extern_port = each.value.port
}

/*
module "nginx" {
  source = "./modules/nginx"
  count = 2

  container_name = "nginx${count.index + 1}"
  container_image_id = docker_image.nginx.image_id
  container_extern_port = 9000 + count.index
}
*/