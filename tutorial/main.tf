terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.1"
    }
  }
}

provider "docker" {}

variable "container_name" {
  description = "foobar"
  type        = string
  default     = "ExampleContainer"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name
  ports {
    internal = 80
    external = 9999
  }
}

output "container_id" {
  description = "Container ID"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "Image ID"
  value       = docker_image.nginx.id
}
