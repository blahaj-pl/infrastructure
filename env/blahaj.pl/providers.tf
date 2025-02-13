provider "scaleway" {
  zone       = "fr-par-1"
  region     = "fr-par"
  access_key = var.scaleway_access_key
  secret_key = var.scaleway_secret_key
}

terraform {
  backend "s3" {
    bucket                      = "tfstate-eriuy4jm"
    key                         = "blahajpl-wfjm8TA5.tfstate"
    region                      = "fr-par"
    skip_credentials_validation = true
    skip_region_validation      = true
    endpoints = {
      s3 = "https://s3.fr-par.scw.cloud"
    }
  }
}

