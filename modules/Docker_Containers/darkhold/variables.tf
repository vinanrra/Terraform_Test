variable "darkhold_image_version" {
    type = string
    description = "Version image of Darkhold"
}

variable "darkhold_container_name" {
    type = string
    description = "Darkhold container name"
}

variable "darkhold_container_restart" {
    type = string
    description = "Docker restart policy"
}

variable "darkhold_container_externalPort" {
    type = number
    description = "Exposed port in host"
}

variable "darkhold_container_volumePath" {
    type = string
    description = "Host folder to save Darkhold database"
}

variable "darkhold_container_memory" {
    type = string
    description = "The maximum amount of memory the container can use."
}