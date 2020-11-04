####### Mgmt VLAN client ########

resource "unifi_user" "pve2_oob" {
  mac = "64:00:6a:c2:53:86"
  name = "pve2.${unifi_network.mgmt.domain_name}"
  fixed_ip = "192.168.2.3"
  network_id = unifi_network.mgmt.id
}

resource "unifi_user" "pve3_oob" {
  mac = "64:00:6a:c2:63:12"
  name = "pve3.${unifi_network.mgmt.domain_name}"
  fixed_ip = "192.168.2.4"
  network_id = unifi_network.mgmt.id 
}

resource "unifi_user" "nqngo_oob" {
  mac = "70:85:c2:54:02:87"
  name = "ws.${unifi_network.mgmt.domain_name}"
  fixed_ip = "192.168.2.10"
  network_id = unifi_network.mgmt.id
}

####### General VLAN client ########

resource "unifi_user" "nqngo_ws" {
  mac = "70:85:c2:54:02:89"
  name = "ws.${unifi_network.lan.domain_name}"
  fixed_ip = "192.168.4.13"
  network_id = unifi_network.lan.id
}