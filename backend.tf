terraform {
  backend "remote" {
    organization = "nqngo"

    workspaces {
      name = "home-network"
    }
  }
}
