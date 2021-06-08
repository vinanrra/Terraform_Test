##############
#  DARKHOLD  #
##############

darkhold_image_version="latest"
darkhold_container_name="darkhold"
darkhold_container_restart="unless-stopped"
darkhold_container_externalPort="8181"
darkhold_container_volumePath="/Users/vinanrra/Documents/Terraform_Test/Docker/Darkhold/db"
darkhold_container_memory="256"
darkhold_container_network="darkhold"

######################
#  LINUXSERVER/SWAG  #
######################

nginx_image_version="latest"
nginx_container_name="nginx"
nginx_container_restart="unless-stopped"
nginx_container_externalPort_80="80"
nginx_container_externalPort_443="443"
nginx_container_volumePath_config="/Users/vinanrra/Documents/Terraform_Test/Docker/Nginx/config"
nginx_container_memory="256"
nginx_container_network="nginx"
nginx_container_env_puid="1000"
nginx_container_env_pgid="1000"
nginx_container_env_tz="Europe/London"
nginx_container_env_url="test.url"
nginx_container_env_subdomains="www,"
nginx_container_env_validation="http"

## Optional ##
nginx_container_env_certprovider=""
## Optional ##
  ## Requieres if VALIDARION is set to dns
## Optional ##
nginx_container_env_dnsplugin="cloudflare"
nginx_container_env_propagation=""
## Optional ##
  ## Requieres if VALIDARION is set to duckdns
nginx_container_env_duckdnstoken=""
## Optional ##
  ## Requieres for ZeroSSL
nginx_container_env_email=""
## Optional ##
nginx_container_env_onlySubdomains="false"
## Optional ##
nginx_container_env_extraDomains=""
## Optional ##
nginx_container_env_staging="false"
## Optional ##
nginx_container_env_maxminddbLicenseKey=""

######################
#  WEEJEWEL/WG-EASY  #
######################

#wgeasy_image_version="latest"
#wgeasy_container_name="wireguard"
#wgeasy_container_restart="unless-stopped"