terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
    desec = {
      source = "valodim/desec"
    }
  }
  required_version = ">= 1.9.0"
}
