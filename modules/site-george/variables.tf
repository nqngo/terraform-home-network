variable "domain" {
  type = string
}

variable "nets" {
  default = {
    lan = {
      name = "Management"
    }
    guest = {
      vlan_id = 3000
      name    = "Guest"
    }
  }
}