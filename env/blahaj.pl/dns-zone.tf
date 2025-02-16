module "subdomain_paste" {
  source  = "../../modules/subdomain"
  domain  = local.domain
  subname = "paste"
  records = {
    A    = ["94.16.120.239"]
    AAAA = ["2a03:4000:21:215::1"]
    TXT  = ["example 1", "example 2"]
  }
}
