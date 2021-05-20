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
resource "docker_image" "darkhold" {
  name         = "surajcm/darkhold"
  keep_locally = false
}

# Create a docker container resource
# SOURCE -> https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "darkhold" {

  # Depends on docker image to avoid create container before image gets pull
  depends_on = [
    docker_image.darkhold,
    docker_network.network_darkhold,
  ]

  name    = "Darkhold_Kahoot"

  image   = docker_image.darkhold.latest

  restart = "unless-stopped"

  # If not present container will be just created and not started
  start = "true"

  # If false Terraform will be "OK" even if container doesnt start
  must_run = "true"

  ports {
      # Container port
      internal = 8181
      # Host port
      external = 8181
      # If not define the default is TCP
      protocol = "tcp"
  }

  volumes {
      container_path = "/tmp/db"
      host_path = "/Users/vinanrra/Documents/Terraform_Test/Docker/Darkhold/db"
  }

  memory = 512

  networks_advanced {
      name = "darkhold"
      aliases = ["darkhold_Container"]
  }
}