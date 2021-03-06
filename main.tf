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

  nginx_container_network = var.nginx_container_network
  darkhold_container_network = var.darkhold_container_network
  #wgeasy_container_network = var.wgeasy_container_network
}

module "docker_container_darkhold" {
  source  = "./modules/Docker_Containers/darkhold"
  # Module dependencies, will "wait" the other module to continue
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
  darkhold_container_network = var.darkhold_container_network
}

module "docker_container_nginx" {
  source  = "./modules/Docker_Containers/nginx"
  # Module dependencies, will "wait" the other module to continue
  depends_on = [
    module.docker_networks.network_nginx,
  ]

  # Assing variable to variable inside module
  # Syntax:
  # MODULE_VAR = VAR_REFERENCE_FROM_MAIN.TF
  nginx_image_version = var.nginx_image_version
  nginx_container_name = var.nginx_container_name
  nginx_container_restart = var.nginx_container_restart
  nginx_container_externalPort_443 = var.nginx_container_externalPort_443
  nginx_container_externalPort_80 = var.nginx_container_externalPort_80
  nginx_container_volumePath_config = var.nginx_container_volumePath_config
  nginx_container_memory = var.nginx_container_memory
  nginx_container_network = var.nginx_container_network
  nginx_container_env_puid = var.nginx_container_env_puid
  nginx_container_env_pgid = var.nginx_container_env_pgid
  nginx_container_env_tz = var.nginx_container_env_tz
  nginx_container_env_url = var.nginx_container_env_url
  nginx_container_env_subdomains = var.nginx_container_env_subdomains
  nginx_container_env_validation = var.nginx_container_env_validation
  nginx_container_env_certprovider = var.nginx_container_env_certprovider
  nginx_container_env_dnsplugin = var.nginx_container_env_dnsplugin
  nginx_container_env_propagation = var.nginx_container_env_propagation
  nginx_container_env_duckdnstoken = var.nginx_container_env_duckdnstoken
  nginx_container_env_email = var.nginx_container_env_email
  nginx_container_env_onlySubdomains = var.nginx_container_env_onlySubdomains
  nginx_container_env_extraDomains = var.nginx_container_env_extraDomains
  nginx_container_env_staging = var.nginx_container_env_staging
  nginx_container_env_maxminddbLicenseKey  = var.nginx_container_env_maxminddbLicenseKey
}

#module "docker_container_wg-easy" {
#  source  = "./modules/Docker_Containers/wg-easy"
   # Module dependencies, will "wait" the other module to continue
#  depends_on = [
#    module.docker_networks.network_wg-easy,
#  ]
#
#  wgeasy_container_network = var.wgeasy_container_network
#  
#}