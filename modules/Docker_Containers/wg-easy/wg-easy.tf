# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      # If not especify will choose latest
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
resource "docker_image" "wgeasy" {
  name         = "weejewel/wg-easy:${var.wgeasy_image_version}"
  # If true image will persist after "terraform destroy"
  keep_locally = false
}

# Create a docker container resource
# SOURCE -> https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "wgeasy" {

  # Depends on docker image to avoid create container before image gets pull
  depends_on = [
    docker_image.wgeasy,
  ]

  # Container name
  name    = var.wgeasy_container_name

  # Image to use with tag at the end
  image   = docker_image.wgeasy.name

  # This is from docker | Restart container unless stopped manually
  restart = var.wgeasy_container_restart

  # If not present container will be just created and not started
  start = "true"

  # If false Terraform will be "OK" even if container doesnt start
  must_run = "true"

  

  # RAM memory of the container
  memory = var.wgeasy_container_memory

  # The network where container will be created
  networks_advanced {
      name = var.wgeasy_container_network
      aliases = ["wgeasy_container"]
  }

}
