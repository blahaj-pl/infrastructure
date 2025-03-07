data "scaleway_account_project" "current" {}

data "scaleway_iam_group" "administrators" {
  name = "Administrators"
}
