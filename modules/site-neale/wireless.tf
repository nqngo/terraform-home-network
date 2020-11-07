data "unifi_wlan_group" "default" {}

data "unifi_radius_profile" "default" {}

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
  user_group_id = unifi_user_group.d50u20.id
  vlan_id       = var.nets.iot.vlan_id
  wlan_group_id = data.unifi_wlan_group.default.id
}
