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

# Configure the docker provider
provider "docker" {
}

module "docker_container_darkhold" {
  source  = "./modules/Docker_Containers/darkhold"
}

module "docker_container_nginx" {
  source  = "./modules/Docker_Containers/nginx"
}

module "docker_networks" {
  source  = "./modules/Docker_Networks"
}