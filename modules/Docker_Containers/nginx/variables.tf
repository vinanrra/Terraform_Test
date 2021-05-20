variable "nginx_image_version" {
    type = string
    description = "Version image of nginx"
}

variable "nginx_container_name" {
    type = string
    description = "nginx container name"
}

variable "nginx_container_restart"  {
    type = string
    description = "Docker restart policy"
}

variable "nginx_container_externalPort_80" {
    type = number
    description = "Exposed HTTP port from container"
}

variable "nginx_container_externalPort_443" {
    type = number
    description = "Exposed HTTPS port from container"
}

variable "nginx_container_volumePath_config" {
    type = string
    description = "Nginx container 'config' folder"
}

variable "nginx_container_memory" {
    type = string
    description = "The maximum amount of memory the container can use."
}
