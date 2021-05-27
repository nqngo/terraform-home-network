# Each VLAN is a submodule
module "admin_clients" {
  source = "./modules/users"
  providers = {
    unifi = unifi
  }
  csv_path    = "${path.module}/data/admin.csv"
  domain_name = unifi_network.admin.domain_name
  network_id  = unifi_network.admin.id
}

module "mgmt_clients" {
  source = "./modules/users"
  providers = {
    unifi = unifi
  }
  csv_path    = "${path.module}/data/mgmt.csv"
  domain_name = unifi_network.mgmt.domain_name
  network_id  = unifi_network.mgmt.id
}

module "lan_clients" {
  source = "./modules/users"
  providers = {
    unifi = unifi
  }
  csv_path    = "${path.module}/data/lan.csv"
  domain_name = unifi_network.lan.domain_name
  network_id  = unifi_network.lan.id
}

module "vm_clients" {
  source = "./modules/users"
  providers = {
    unifi = unifi
  }
  csv_path    = "${path.module}/data/vm.csv"
  domain_name = unifi_network.vm.domain_name
  network_id  = unifi_network.vm.id
}
