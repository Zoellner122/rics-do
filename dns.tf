resource "digitalocean_domain" "romanoffindustries" {
  name = "romanoffindustries.nl"
}

resource "digitalocean_domain" "ri-cs" {
  name = "ri-cs.nl"
}

resource "digitalocean_record" "teemo_mx" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "mail.ri-cs.nl."
}

resource "digitalocean_record" "teemo_a" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "A"
  name  = "mail"
  value = digitalocean_droplet.teemo.ipv4_address
}

resource "digitalocean_record" "teemo_cname" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "CNAME"
  name  = "teemo"
  value = "mail.ri-cs.nl."
}

resource "digitalocean_record" "teemo_aaaa" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "AAAA"
  name  = "mail"
  value = digitalocean_droplet.teemo.ipv6_address
}

resource "digitalocean_record" "teemo_spf" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "TXT"
  name  = "@"
  value = join(" ", ["v=spf1", "a", "mx", "ipv4:${digitalocean_droplet.teemo.ipv4_address}", "ipv6:${digitalocean_droplet.teemo.ipv6_address}", "-all"])
}

resource "digitalocean_record" "teemo_dmarc" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "TXT"
  name  = "_dmarc"
  value = "v=DMARC1;p=reject;sp=reject;pct=100;rua=mailto:webmaster@ri-cs.nl;ruf=mailto:webmaster@ri-cs.nl;ri=86400;aspf=s;adkim=s;fo=1"
}

resource "digitalocean_record" "teemo_autodiscover" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "CNAME"
  name  = "autodiscover"
  value = "mail.ri-cs.nl."
}

resource "digitalocean_record" "teemo_autoconfig" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "CNAME"
  name  = "autoconfig"
  value = "mail.ri-cs.nl."
}

resource "digitalocean_record" "teemo_dkim" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "TXT"
  name  = "dkim._domainkey"
  value = "v=DKIM1;k=rsa;t=s;s=email;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwReYerwXjABdaqKyebYhD/xsTz0yWV51qQI+zgogLf6hjYQ1rWSMcxWilAhAqGGQtmtpvoyXWL21MojQO73e/PFGtLvuCEYZYVgAAKpUB8qDcb0TqEnAPiT/0tgtMR40qQMFp6D+vgKoi93asuYw4fsQuNd0CsoB4mJEE9sKSp8mUgKtCeOZ0qhQJRdXnedBQC92cAHQw+zuYM42O7jjMCsJN7ld0NrSslWtscEZWbg+T4EtC+sE9l38THyv60j7s7cvnWXClUXfutk0PQ5Yje+Au30ry9scyQFC7wH9Z1j9shFwMISVVurPhJrwKtcpefNloAyYLlBQAWbsySPdEwIDAQAB"
}

resource "digitalocean_record" "braum_a" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.braum
  ]
  type  = "A"
  name  = digitalocean_droplet.braum.name
  value = digitalocean_droplet.braum.ipv4_address
}

resource "digitalocean_record" "braum_aaaa" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.braum
  ]
  type  = "AAAA"
  name  = digitalocean_droplet.braum.name
  value = digitalocean_droplet.braum.ipv6_address
}

resource "digitalocean_record" "lulu_a" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.lulu
  ]
  type  = "A"
  name  = digitalocean_droplet.lulu.name
  value = digitalocean_droplet.lulu.ipv4_address
}

resource "digitalocean_record" "lulu_aaaa" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.lulu
  ]
  type  = "AAAA"
  name  = digitalocean_droplet.lulu.name
  value = digitalocean_droplet.lulu.ipv6_address
}