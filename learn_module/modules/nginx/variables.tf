variable "container_name" {
  description = "container name"
  type = string
}

variable "nginx_image_tag" {
  description = "nginx image tag"
  type = string
  default = "latest"
}

variable "container_extern_port" {
  description = "container external port"
  type = number
}
