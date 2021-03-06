data "unifi_wlan_group" "default" {}

data "unifi_radius_profile" "default" {}

resource "unifi_user_group" "d50u10" {
  name = "50/10"

  qos_rate_max_down = 50000 # 50 mbps
  qos_rate_max_up   = 10000 # 10 mbps
}

resource "unifi_user_group" "d100u10" {
  name = "100/10"

  qos_rate_max_down = 100000 # 100 mbps
  qos_rate_max_up   = 10000  # 10 mbps
}

resource "unifi_user_group" "d50u20" {
  name = "50/20"

  qos_rate_max_down = 50000 # 50 mbps
  qos_rate_max_up   = 20000 # 20 mbps
}

resource "unifi_user_group" "d80u20" {
  name = "80/20"

  qos_rate_max_down = 80000 # 80 mbps
  qos_rate_max_up   = 20000 # 20 mbps
}

resource "unifi_wlan" "iot" {
  name          = "N2UNET_IoT"
  security      = "wpapsk"
  passphrase    = var.iot_passphrase
  user_group_id = unifi_user_group.d100u10.id
  vlan_id       = var.nets.iot.vlan_id
  wlan_group_id = data.unifi_wlan_group.default.id
}

resource "unifi_wlan" "n3" {
  name          = "N3NET"
  security      = "wpapsk"
  passphrase    = var.n3_passphrase
  user_group_id = unifi_user_group.d100u10.id
  vlan_id       = var.nets.n3.vlan_id
  wlan_group_id = data.unifi_wlan_group.default.id
}