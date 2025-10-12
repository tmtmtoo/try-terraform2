output "container_id" {
  description = "container id"
  value = docker_container.nginx.id
}

output "image_id" {
  description = "image id"
  value = docker_image.nginx.id
}
