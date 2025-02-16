module "tutanota_root" {
  source = "../subdomain"

  domain  = var.domain
  subname = var.subname
  records = {
    MX  = ["1 mail.tutanota.de."]
    TXT = concat(["t-verify=${var.t_verify}", "v=spf1 include:spf.tutanota.de -all"], var.txt)
  }
}

module "tutanota_dmarc" {
  source = "../subdomain"

  domain  = var.domain
  subname = "_dmarc${local.subname}"
  records = {
    TXT = ["v=DMARC1; p=quarantine; adkim=s"]
  }
}

module "tutanota__mta-sts" {
  source = "../subdomain"

  domain  = var.domain
  subname = "_mta-sts${local.subname}"
  records = {
    CNAME = ["mta-sts.tutanota.de."]
  }
}

module "tutanota_mta-sts" {
  source = "../subdomain"

  domain  = var.domain
  subname = "mta-sts${local.subname}"
  records = {
    CNAME = ["mta-sts.tutanota.de."]
  }
}

module "tutanota_domainkey_s1" {
  source = "../subdomain"

  domain  = var.domain
  subname = "s1._domainkey${local.subname}"
  records = {
    CNAME = ["s1.domainkey.tutanota.de."]
  }
}

module "tutanota_domainkey_s2" {
  source = "../subdomain"

  domain  = var.domain
  subname = "s2._domainkey${local.subname}"
  records = {
    CNAME = ["s2.domainkey.tutanota.de."]
  }
}

