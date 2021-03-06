# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

# Create a new docker network
resource "docker_network" "network_darkhold" {
  name = var.darkhold_container_network
  check_duplicate = "true"
}

resource "docker_network" "network_nginx" {
  name = var.nginx_container_network
  check_duplicate = "true"
}

#resource "docker_network" "network_wg-easy" {
#  name = var.wgeasy_container_network
#  check_duplicate = "true"
#}
