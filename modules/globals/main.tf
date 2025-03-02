locals {
  infra = {
    instances = {

      jattelik = {
        provider = "netcup"
        type     = "VPS 2000 ARM G11 SE"
        hostname = "jattelik"
        ranges = {
          ipv4 = { primary = "152.53.113.46/32" }
          ipv6 = { primary = "2a0a:4cc0:80:41c1::/64" }
        }
        addresses = {
          ipv4 = {
            primary = {
              address = "152.53.113.46"
              rdns    = "jattelik.s.blahaj.pl"
            }
          }
          ipv6 = {
            primary = {
              address = "2a0a:4cc0:80:41c1::1"
              rdns    = "jattelik.s.blahaj.pl"
            }
          }
        }
      }

    }
  }
}
