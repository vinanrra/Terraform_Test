variable "wgeasy_image_version" {
    type = string
    description = "Version image of wgeasy"
}

variable "wgeasy_container_name" {
    type = string
    description = "wg-easy container name"
}

variable "wgeasy_container_restart"  {
    type = string
    description = "Docker restart policy"
}

variable "wgeasy_container_memory" {
    type = string
    description = "The maximum amount of memory the container can use."
}