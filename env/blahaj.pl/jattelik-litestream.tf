module "jattelik_litestream" {
  source = "../../modules/bucket_for_application"

  application = "litestream"
  hostname    = "jattelik"
}
