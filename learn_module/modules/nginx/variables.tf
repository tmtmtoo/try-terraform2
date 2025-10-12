variable "container_name" {
  description = "container name"
  type = string
}

variable "container_image_id" {
  default = "container image id"
  type = string
}

variable "container_extern_port" {
  description = "container external port"
  type = number
}
