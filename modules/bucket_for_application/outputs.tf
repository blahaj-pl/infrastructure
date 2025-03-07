output "application_id" {
  value = scaleway_iam_application.this.id
}

output "bucket_name" {
  value = local.bucket_name
}

output "bucket_id" {
  value = module.bucket.bucket_id
}

output "bucket_endpoint" {
  value = module.bucket.bucket_endpoint
}
