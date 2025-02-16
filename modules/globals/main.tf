locals {
  infra = {
    instances = {
      blavingad = {
        provider = "netcup"
        type     = "RS 1000 G11"
        hostname = "blavingad"
        rdns     = "blavingad.nekopon.pl"
        ranges = {
          ipv4 = "94.16.120.239/32"
          ipv6 = "2a03:4000:21:215::/64"
        }
        addresses = {
          ipv4 = "94.16.120.239"
          ipv6 = "2a03:4000:21:215::1"
        }
      }
    }
  }
}
