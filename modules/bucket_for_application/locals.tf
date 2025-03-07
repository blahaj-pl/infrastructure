resource "random_string" "bucket_suffix" {
  length    = 8
  min_lower = 8
}

locals {
  bucket_name = "${var.hostname}-${var.application}-${random_string.bucket_suffix.result}"
  bucket_policy = {
    Version = "2023-04-17",
    Id      = "${local.bucket_name}-bucket-policy",
    Statement = [
      {
        Sid    = "S3AllowAll",
        Effect = "Allow",
        Principal = {
          SCW = tolist(concat(
            formatlist("user_id:%s", data.scaleway_iam_group.administrators.user_ids),
            formatlist("application_id:%s", data.scaleway_iam_group.administrators.application_ids)
          ))
        },
        Action = [
          "s3:*"
        ],
        Resource = [local.bucket_name]
      },
      {
        Sid    = "S3LevelStatement",
        Effect = "Allow",
        Principal = {
          SCW = ["application_id:${scaleway_iam_application.this.id}"]
        },
        Action = [
          "s3:GetBucketLocation",
          "s3:ListBucket"
        ],
        Resource = [local.bucket_name]
      },
      {
        Sid    = "BucketLevelStatement",
        Effect = "Allow",
        Principal = {
          SCW = ["application_id:${scaleway_iam_application.this.id}"]
        },
        Action = [
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:GetObject"
        ],
        Resource = [
          local.bucket_name,
          "${local.bucket_name}/*"
        ]
      }
    ]
  }
}
