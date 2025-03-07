module "bucket" {
  source  = "scaleway-terraform-modules/bucket/scaleway"
  version = "1.0.1"

  name   = local.bucket_name
  policy = local.bucket_policy
}

resource "scaleway_iam_application" "this" {
  name        = "${var.application}-${var.hostname}"
  description = "Scaleway Application for ${var.application} running on ${var.hostname}"
}

resource "scaleway_iam_policy" "this" {
  application_id = scaleway_iam_application.this.id
  rule {
    project_ids          = [data.scaleway_account_project.current.id]
    permission_set_names = ["ObjectStorageObjectsWrite", "ObjectStorageObjectsRead", "ObjectStorageObjectsDelete"]
  }
}
