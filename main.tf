# Set alias for each site, no longer required for 0.18.0
# but I found it is slightly easier to manage instead of
# define site property for each resource in the module
provider "unifi" {
  alias = "neale"
  site  = "3i1ule1r"
}

provider "unifi" {
  alias = "george"
  site  = "d3xnhnwh"
}

# Import site- modules
module "site-neale" {
  source = "./modules/site-neale"
  providers = {
    unifi = unifi.neale
  }
  domain         = var.neale_domain
  iot_passphrase = var.neale_iot_passphrase
  n3_passphrase  = var.neale_n3_passphrase
}

module "site-george" {
  source = "./modules/site-george"
  providers = {
    unifi = unifi.george
  }
  domain = var.george_domain
}