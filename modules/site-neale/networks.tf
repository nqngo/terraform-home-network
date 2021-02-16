resource "unifi_network" "lan" {
  name        = var.nets.lan.name
  purpose     = "corporate"
  domain_name = "local.${var.domain}"

  subnet       = "192.168.4.1/22"
  dhcp_start   = "192.168.5.0"
  dhcp_stop    = "192.168.7.254"
  dhcp_enabled = true

}

resource "unifi_network" "mgmt" {
  name        = var.nets.mgmt.name
  purpose     = "corporate"
  domain_name = "oob.${var.domain}"

  subnet       = "192.168.2.1/24"
  vlan_id      = var.nets.mgmt.vlan_id
  dhcp_start   = "192.168.2.200"
  dhcp_stop    = "192.168.2.254"
  dhcp_enabled = true

}

resource "unifi_network" "compute" {
  name        = var.nets.compute.name
  purpose     = "corporate"
  domain_name = "compute.${var.domain}"

  subnet       = "192.168.8.1/24"
  vlan_id      = var.nets.compute.vlan_id
  dhcp_start   = "192.168.8.30"
  dhcp_stop    = "192.168.8.254"
  dhcp_enabled = true
}

resource "unifi_network" "ceph" {
  name        = var.nets.ceph.name
  purpose     = "corporate"
  domain_name = "ceph.${var.domain}"

  subnet       = "192.168.9.1/24"
  vlan_id      = var.nets.ceph.vlan_id
  dhcp_enabled = false
}

resource "unifi_network" "storage" {
  name        = var.nets.storage.name
  purpose     = "corporate"
  domain_name = "stg.${var.domain}"

  subnet       = "192.168.10.1/24"
  vlan_id      = var.nets.storage.vlan_id
  dhcp_enabled = false
}

resource "unifi_network" "n3" {
  name        = var.nets.n3.name
  purpose     = "corporate"
  domain_name = "3n.${var.domain}"

  subnet       = "192.168.11.1/24"
  vlan_id      = var.nets.n3.vlan_id
  dhcp_start   = "192.168.11.5"
  dhcp_stop    = "192.168.11.254"
  dhcp_enabled = true
}

resource "unifi_network" "iot" {
  name        = var.nets.iot.name
  purpose     = "corporate"
  domain_name = "iot.${var.domain}"

  subnet       = "192.168.100.1/24"
  vlan_id      = var.nets.iot.vlan_id
  dhcp_start   = "192.168.100.6"
  dhcp_stop    = "192.168.100.254"
  dhcp_enabled = true
}

