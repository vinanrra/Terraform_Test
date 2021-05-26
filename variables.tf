##############
#  DARKHOLD  #
##############

variable "darkhold_image_version" {
    type = string
    description = "Version image of Darkhold"
}

variable "darkhold_container_name" {
    type = string
    description = "Darkhold container name"
}

variable "darkhold_container_restart" {
    type = string
    description = "Docker restart policy"
}

variable "darkhold_container_externalPort" {
    type = number
    description = "Exposed port in host"
}

variable "darkhold_container_volumePath" {
    type = string
    description = "Host folder to save Darkhold database"
}

variable "darkhold_container_memory" {
    type = string
    description = "The maximum amount of memory the container can use."
}

######################
#  LINUXSERVER/SWAG  #
######################

variable "nginx_image_version" {
    type = string
    description = "Version image of nginx"
}

variable "nginx_container_name" {
    type = string
    description = "nginx container name"
}

variable "nginx_container_restart" {
    type = string
    description = "Docker restart policy"
}

variable "nginx_container_externalPort_80" {
    type = number
    description = "Exposed HTTP port from container"
}

variable "nginx_container_externalPort_443" {
    type = number
    description = "Exposed HTTPS port from container"
}

variable "nginx_container_volumePath_config" {
    type = string
    description = "Nginx container 'config' folder"
}

variable "nginx_container_memory" {
    type = string
    description = "The maximum amount of memory the container can use."
}

variable "darkhold_container_network" {
    type = string
    description = "Network where Darkhold container will be."
}

variable "nginx_container_network" {
    type = string
    description = "Network where Nginx container will be."
}

variable "nginx_container_env_puid" {
    type = string
    description = "UserID env"
}

variable "nginx_container_env_pgid" {
    type = string
    description = "GroupID env"
}

variable "nginx_container_env_tz" {
    type = string
    description = "Specify a timezone to use EG Europe/London."
}

variable "nginx_container_env_url" {
    type = string
    description = "Top url you have control over (customdomain.com if you own it, or customsubdomain.ddnsprovider.com if dynamic dns)."
}

variable "nginx_container_env_subdomains" {
    type = string
    description = "Subdomains you'd like the cert to cover (comma separated, no spaces) ie. www,ftp,cloud. For a wildcard cert, set this exactly to wildcard (wildcard cert is available via dns and duckdns validation only)"
}

variable "nginx_container_env_validation" {
    type = string
    description = "Certbot validation method to use, options are http, dns or duckdns (dns method also requires DNSPLUGIN variable set) (duckdns method requires DUCKDNSTOKEN variable set, and the SUBDOMAINS variable must be either empty or set to wildcard)."
}

variable "nginx_container_env_certprovider" {
    type = string
    description = "Optionally define the cert provider. Set to zerossl for ZeroSSL certs (requires existing ZeroSSL account and the e-mail address entered in EMAIL env var). Otherwise defaults to Let's Encrypt."
}

variable "nginx_container_env_dnsplugin" {
    type = string
    description = "Required if VALIDATION is set to dns. Options are aliyun, cloudflare, cloudxns, cpanel, digitalocean, directadmin, dnsimple, dnsmadeeasy, domeneshop, gandi, gehirn, google, hetzner, inwx, linode, luadns, netcup, njalla, nsone, ovh, rfc2136, route53, sakuracloud, transip and vultr. Also need to enter the credentials into the corresponding ini (or json for some plugins) file under /config/dns-conf."
}

variable "nginx_container_env_propagation" {
    type = string
    description = "Optionally override (in seconds) the default propagation time for the dns plugins."
}

variable "nginx_container_env_duckdnstoken" {
    type = string
    description = "Required if VALIDATION is set to duckdns. Retrieve your token from https://www.duckdns.org"
}

variable "nginx_container_env_email" {
    type = string
    description = "Optional e-mail address used for cert expiration notifications (Required for ZeroSSL)."
}

variable "nginx_container_env_onlySubdomains" {
    type = string
    description = "If you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to true"
}

variable "nginx_container_env_extraDomains" {
    type = string
    description = "Additional fully qualified domain names (comma separated, no spaces) ie. extradomain.com,subdomain.anotherdomain.org,*.anotherdomain.org"
}

variable "nginx_container_env_staging" {
    type = string
    description = "Set to true to retrieve certs in staging mode. Rate limits will be much higher, but the resulting cert will not pass the browser's security test. Only to be used for testing purposes."
}

variable "nginx_container_env_maxminddbLicenseKey" {
    type = string
    description = "Add your MaxmindDB license key to automatically download the GeoLite2-City.mmdb database. Download location is /config/geoip2db. The database is updated weekly."
}

######################
#  WEEJEWEL/WG-EASY  #
######################

#variable "wgeasy_container_network" {
#    type = string
#    description = "Network where Wireguard container will be."
#}
