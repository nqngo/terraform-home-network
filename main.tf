provider "unifi" {
  alias = "neale"
  site  = "3i1ule1r"
}

provider "unifi" {
  alias = "george"
  site  = "d3xnhnwh"
}

module "site-neale" {
  source    = "./modules/site-neale"
  providers = {
    unifi = unifi.neale
  }
  domain = var.neale_domain
  iot_passphrase = var.neale_iot_passphrase
}

module "site-george" {
  source = "./modules/site-george"
  providers = {
    unifi = unifi.george
  }
}