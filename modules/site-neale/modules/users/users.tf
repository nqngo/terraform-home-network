locals {
  userscsv = csvdecode(file(var.csv_path))
  users    = { for user in local.userscsv : user.mac => user }
}

resource "unifi_user" "users" {
  for_each = local.users

  mac      = each.key
  name     = "${each.value.name}.${var.domain_name}"
  fixed_ip = each.value.fixed_ip
  note     = trimspace(each.value.note)

  network_id = var.network_id

  allow_existing = true

}