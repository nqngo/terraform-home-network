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
    admin = {
      vlan_id = 2
      name    = "Admin"
    }
    maas = {
      vlan_id = 3
      name    = "MAAS Managed"
    }
    mgmt = {
      vlan_id = 10
      name    = "Management"
    }
    compute = {
      vlan_id = 11
      name    = "Compute"
    }
    vm = {
      vlan_id = 12
      name    = "Virtual Machine"
    }
    svc = {
      vlan_id = 13
      name    = "Public Service"
    }
    sync = {
      vlan_id = 19
      name    = "Corosync"
    }
    storage = {
      vlan_id = 20
      name    = "Ceph Public"
    }
    ceph = {
      vlan_id = 21
      name    = "Ceph Cluster"
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