resource "unifi_network" "lan" {
  name        = var.nets.lan.name
  purpose     = "corporate"
  domain_name = "mgmt.${var.domain}"

  subnet       = "192.168.2.1/24"
  dhcp_start   = "192.168.2.6"
  dhcp_stop    = "192.168.2.254"
  dhcp_enabled = true

}

resource "unifi_network" "guest" {
  name    = var.nets.guest.name
  purpose = "guest"

  subnet       = "192.168.4.1/22"
  vlan_id      = var.nets.guest.vlan_id
  dhcp_start   = "192.168.4.16"
  dhcp_stop    = "192.168.7.254"
  dhcp_enabled = true

}
