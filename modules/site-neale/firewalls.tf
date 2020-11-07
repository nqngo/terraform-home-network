resource "unifi_firewall_group" "rfc1918" {
  name = "RFC1918"
  type = "address-group"

  members = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

resource "unifi_firewall_group" "allow_all_ports" {
  name = "Ports that are allowed on all subnet"
  type = "port-group"
  # Allow DNS and DHCP traffics
  members = ["53", "67", "68"]
}

resource "unifi_firewall_rule" "allow_on_all" {
  name                   = "Allow some ports on all network"
  action                 = "accept"
  ruleset                = "LAN_IN"
  rule_index             = 2001
  protocol               = "all"
  dst_firewall_group_ids = [unifi_firewall_group.allow_all_ports.id]
}

resource "unifi_firewall_rule" "iot_to_general" {
  name              = "Enable related & established trafics from IoT to General"
  action            = "accept"
  ruleset           = "LAN_IN"
  rule_index        = 2996
  protocol          = "all"
  src_network_id    = unifi_network.iot.id
  dst_network_id    = unifi_network.lan.id
  state_established = true
  state_related     = true
}

resource "unifi_firewall_rule" "general_to_iot" {
  name           = "Enable access for General to IoT"
  action         = "accept"
  ruleset        = "LAN_IN"
  rule_index     = 2997
  protocol       = "all"
  src_network_id = unifi_network.lan.id
  dst_network_id = unifi_network.iot.id
}

resource "unifi_firewall_rule" "enable_dns" {
  name        = "Enable access to DNS server"
  action      = "accept"
  ruleset     = "LAN_IN"
  rule_index  = 2998
  protocol    = "tcp"
  dst_address = "192.168.0.254"
}

resource "unifi_firewall_rule" "block_vlan" {
  name                   = "Block all interVLAN traffics"
  action                 = "drop"
  ruleset                = "LAN_IN"
  rule_index             = 2999
  protocol               = "all"
  src_firewall_group_ids = [unifi_firewall_group.rfc1918.id]
  dst_firewall_group_ids = [unifi_firewall_group.rfc1918.id]
}