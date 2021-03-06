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
resource "docker_image" "nginx" {
  name         = "linuxserver/swag:${var.nginx_image_version}"
  # If true image will persist after "terraform destroy"
  keep_locally = false
}

# Create a docker container resource
# SOURCE -> https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "nginx" {

  # Depends on docker image to avoid create container before image gets pull
  depends_on = [
    docker_image.nginx,
  ]

  # Container name
  name    = var.nginx_container_name

  # Image to use with tag at the end
  image   = docker_image.nginx.name

  # This is from docker | Restart container unless stopped manually
  restart = var.nginx_container_restart

  # If not present container will be just created and not started
  start = "true"

  # If false Terraform will be "OK" even if container doesnt start
  must_run = "true"

  # Enviroments of the container check image docs to know more
  env = ["PUID=${var.nginx_container_env_puid}",
         "PGID=${var.nginx_container_env_pgid}",
         "TZ=${var.nginx_container_env_tz}",
         "URL=${var.nginx_container_env_url}",
         "SUBDOMAINS=${var.nginx_container_env_subdomains}",
         "VALIDATION=${var.nginx_container_env_validation}",
         "CERTPROVIDER=${var.nginx_container_env_certprovider}",
         "DNSPLUGIN=${var.nginx_container_env_dnsplugin}",
         "PROPAGATION=${var.nginx_container_env_propagation}",
         "DUCKDNSTOKEN=${var.nginx_container_env_duckdnstoken}",
         "EMAIL=${var.nginx_container_env_email}",
         "ONLY_SUBDOMAINS=${var.nginx_container_env_onlySubdomains}",
         "EXTRA_DOMAINS=${var.nginx_container_env_extraDomains}",
         "STAGING=${var.nginx_container_env_staging}",
         "MAXMINDDB_LICENSE_KEY=${var.nginx_container_env_maxminddbLicenseKey}"
         ]

  # Ports must create one per port
  ports {
      # Container port
      internal = 443
      # Host port
      external = var.nginx_container_externalPort_443
      # If not define the default is TCP
      protocol = "tcp"
  }

    ports {
      # Container port
      internal = 80
      # Host port
      external = var.nginx_container_externalPort_80
      # If not define the default is TCP
      protocol = "tcp"
  }

  volumes {
      container_path = "/config"
      host_path = var.nginx_container_volumePath_config
  }

  # RAM memory of the container
  memory = var.nginx_container_memory

  # The network where container will be created
  networks_advanced {
      name = var.nginx_container_network
      aliases = ["nginx_Container"]
  }
}
