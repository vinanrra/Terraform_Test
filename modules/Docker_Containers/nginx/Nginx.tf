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

# Create a docker image resource
# Sintax:
#   resource "TYPE" "NAME"{
#     VARS
#   }
# SOURCE -> https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image
resource "docker_image" "nginx" {
  name         = "linuxserver/swag"
  keep_locally = false
}

# Create a docker container resource
# SOURCE -> https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "nginx" {

  # Depends on docker image to avoid create container before image gets pull
  depends_on = [
    docker_image.nginx,
    docker_network.network_nginx,
  ]

  name    = "Nginx"

  image   = docker_image.nginx.latest

  restart = "unless-stopped"

  # If not present container will be just created and not started
  start = "true"

  # If false Terraform will be "OK" even if container doesnt start
  must_run = "true"

  env = ["TZ=Europe/Madrid"]

  ports {
      # Container port
      internal = 443
      # Host port
      external = 443
      # If not define the default is TCP
      protocol = "tcp"
  }

    ports {
      # Container port
      internal = 80
      # Host port
      external = 80
      # If not define the default is TCP
      protocol = "tcp"
  }

  volumes {
      container_path = "/config"
      host_path = "/Users/vinanrra/Documents/Terraform_Test/Docker/Nginx/config"
  }

  memory = 512

  networks_advanced {
      name = "nginx"
      aliases = ["nginx_container"]
  }
}