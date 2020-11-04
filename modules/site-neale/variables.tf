variable "iot_passphrase" {
  type = string
}

variable "domain" {
  type = string
}

variable "nets" {
  default = {
    lan = {
      name = "General"
    }
    mgmt = {
      vlan_id = 10
      name = "Management"
    }
    storage = {
      vlan_id = 20
      name = "Storage"
    }

    iot = {
      vlan_id = 30
      name = "IoT"
    }

    guest = {
      vlan_id = 40
      name = "Guest"
    }
  }
}