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
      name      = "MAAS Managed"
      purpose   = "vlan-only"
      subdomain = "maas"
      subnet    = "192.168.30.0/24"
    }
    mgmt = {
      vlan_id    = 10
      name       = "Management"
      purpose    = "corporate"
      subdomain  = "oob"
      subnet     = "192.168.2.1/24"
      dhcp_start = "192.168.2.200"
      dhcp_stop  = "192.168.2.254"
    }
    // compute = {
    //   vlan_id = 11
    //   name    = "Compute"
    // }
    // vm = {
    //   vlan_id = 12
    //   name    = "Virtual Machine"
    // }
    // svc = {
    //   vlan_id = 13
    //   name    = "Public Service"
    // }
    // sync = {
    //   vlan_id = 19
    //   name    = "Corosync"
    // }
    // storage = {
    //   vlan_id = 20
    //   name    = "Ceph Public"
    // }
    // ceph = {
    //   vlan_id = 21
    //   name    = "Ceph Cluster"
    // }
    protect = {
      vlan_id = 29
      name    = "Unifi Protect"
      purpose = "corporate"
      subdomain = "protect"
      subnet  = "192.168.29.1/24"
      dhcp_start = "192.168.29.100"
      dhcp_stop  = "192.168.29.254"
    }
    iot = {
      vlan_id = 30
      name    = "IoT"
    }

    n3 = {
      vlan_id = 31
      name    = "Neale3rd"
    }

    guest = {
      vlan_id = 40
      name    = "Guest"
    }

  }
}