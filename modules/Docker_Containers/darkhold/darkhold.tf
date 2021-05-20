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
  # Name of the image
  name         = "surajcm/darkhold"
  # If true image will persist after "terraform destroy"
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

  # Container name
  name    = "Darkhold_Kahoot"

  # Image to use with tag at the end
  image   = docker_image.darkhold.latest

  # This is from docker | Restart container unless stopped manually
  restart = "unless-stopped"

  # If not present container will be just created and not started
  start = "true"

  # If false Terraform will be "OK" even if container doesnt start
  must_run = "true"

  # Ports must create one per port
  ports {
      # Container port
      internal = 8181
      # Host port
      external = 8181
      # If not define the default is TCP
      protocol = "tcp"
  }

  # Volume to bind container with host
  volumes {
      container_path = "/tmp/db"
      host_path = "/Users/vinanrra/Documents/Terraform_Test/Docker/Darkhold/db"
  }

  # RAM memory of the container
  memory = 512

  # The network where container will be created
  networks_advanced {
      name = "darkhold"
      aliases = ["darkhold_Container"]
  }
}