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

module "docker_networks" {
  source  = "./modules/Docker_Networks"
}
module "docker_container_darkhold" {
  source  = "./modules/Docker_Containers/darkhold"
  depends_on = [
    module.docker_networks.network_darkhold,
  ]

  # Assing variable to variable inside module
  # Syntax:
  # MODULE_VAR = VAR_REFERENCE_FROM_MAIN.TF
  darkhold_image_version = var.darkhold_image_version
  darkhold_container_name = var.darkhold_container_name
  darkhold_container_restart = var.darkhold_container_restart
  darkhold_container_externalPort = var.darkhold_container_externalPort
  darkhold_container_volumePath = var.darkhold_container_volumePath
  darkhold_container_memory = var.darkhold_container_memory
}

module "docker_container_nginx" {
  source  = "./modules/Docker_Containers/nginx"
  depends_on = [
    module.docker_networks.network_nginx,
  ]

  nginx_image_version = var.nginx_image_version
  nginx_container_name = var.nginx_container_name
  nginx_container_restart = var.nginx_container_restart
  nginx_container_externalPort_443 = var.nginx_container_externalPort_443
  nginx_container_externalPort_80 = var.nginx_container_externalPort_80
  nginx_container_volumePath_config = var.nginx_container_volumePath_config
  nginx_container_memory = var.nginx_container_memory
}
