variable "iot_passphrase" {
  type = string
}

variable "n3_passphrase" {
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
      name    = "Management"
    }
    compute = {
      vlan_id = 19
      name    = "Compute"
    }
    storage = {
      vlan_id = 20
      name    = "Storage"
    }
    ceph = {
      vlan_id = 21
      name    = "Ceph"
    }
    iot = {
      vlan_id = 30
      name    = "IoT"
    }

    n3 = {
      vlan_id = 31
      name    = "3 Neale"
    }

    guest = {
      vlan_id = 40
      name    = "Guest"
    }

  }
}