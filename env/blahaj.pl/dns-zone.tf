module "blahajpl_apex" {
  source = "../../modules/subdomain"

  domain  = local.domain
  subname = ""
  records = {
    AAAA = [module.globals.infra.instances.blavingad.addresses.ipv6]
    A    = [module.globals.infra.instances.blavingad.addresses.ipv4]
    CAA  = ["0 issue \"letsencrypt.org\""]
    TXT  = ["google-site-verification=uo3KlLGcvX17NeS8La_8siSpDXFWtuI2FjifWKioaXI"]
  }
}

module "blahajpl_www" {
  source = "../../modules/subdomain"

  domain  = local.domain
  subname = "www"
  records = {
    CNAME = ["${local.domain}."]
  }
}

module "blahajpl_paste" {
  source = "../../modules/subdomain"

  domain  = local.domain
  subname = "paste"
  records = {
    AAAA = [module.globals.infra.instances.blavingad.addresses.ipv6]
    A    = [module.globals.infra.instances.blavingad.addresses.ipv4]
  }
}

module "blahajpl_gotosocial" {
  source = "../../modules/subdomain"

  domain  = local.domain
  subname = "gts"
  records = {
    AAAA = [module.globals.infra.instances.blavingad.addresses.ipv6]
    A    = [module.globals.infra.instances.blavingad.addresses.ipv4]
  }
}

module "blahajpl__atproto" {
  source = "../../modules/subdomain"

  domain  = local.domain
  subname = "_atproto"
  records = {
    TXT = ["did=did:plc:vqrh5fqhk2oe6mnqi76ngkbm"]
  }
}

module "blahajpl_gh_org_verification" {
  source = "../../modules/subdomain"

  domain  = local.domain
  subname = "_gh-blahaj-pl-o"
  records = {
    TXT = ["6cf7fcf69c"]
  }
}

