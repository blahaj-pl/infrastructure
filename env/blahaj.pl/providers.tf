provider "scaleway" {
  zone       = "fr-par-1"
  region     = "fr-par"
  access_key = var.scaleway_access_key
  secret_key = var.scaleway_secret_key
}

resource "scaleway_secret" "desec_api_token" {
  path = "/terraform/secrets/desec"
  name = "api_token"
}

data "scaleway_secret_version" "desec_api_token" {
  secret_id = scaleway_secret.desec_api_token.id
  revision  = "latest"
}

provider "desec" {
  api_token = base64decode(data.scaleway_secret_version.desec_api_token.data)
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

