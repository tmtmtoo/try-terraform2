terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.1"
    }
  }
}

provider "docker" {}

/*
locals {
  nginx_instances = {
    nginx1 = { port = 9000, image_tag = "latest" }
    nginx2 = { port = 9001, image_tag = "latest" }
  }
}

module "nginx" {
  source = "./modules/nginx"
  for_each = local.nginx_instances

  container_name = each.key
  container_extern_port = each.value.port
  nginx_image_tag = each.value.image_tag
}
*/

module "nginx" {
  source = "./modules/nginx"
  count = 2

  container_name = "nginx${count.index + 1}"
  container_extern_port = 9000 + count.index
  nginx_image_tag = "latest"
}
