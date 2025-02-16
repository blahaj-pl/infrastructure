resource "desec_rrset" "this" {
  for_each = { for type, values in var.records : type => toset(values) }

  domain  = var.domain
  subname = var.subname
  type    = each.key
  records = tolist(each.value)
  ttl     = var.ttl
}
