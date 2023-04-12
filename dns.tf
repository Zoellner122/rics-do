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
  name  = digitalocean_droplet.teemo.name
  value = digitalocean_droplet.teemo.ipv4_address
}

resource "digitalocean_record" "teemo_cname" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "CNAME"
  name  = "mail"
  value = "teemo.ri-cs.nl."
}

resource "digitalocean_record" "teemo_aaaa" {
  domain = digitalocean_domain.ri-cs.id
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type  = "AAAA"
  name  = digitalocean_droplet.teemo.name
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
  name  = "@"
  value = "v=DMARC1;p=reject;sp=reject;pct=100;rua=mailto:webmaster@ri-cs.nl;ruf=mailto:webmaster@ri-cs.nl;ri=86400;aspf=s;adkim=s;fo=1"
}

resource "digitalocean_record" "teemo_autodiscover" {
  domain = digitalocean_domain.ri-cs
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type = "CNAME"
  name = "autodiscover"
  value = "mail.ri-cs.nl."
}

resource "digitalocean_record" "teemo_autoconfig" {
  domain = digitalocean_domain.ri-cs
  depends_on = [
    digitalocean_domain.ri-cs,
    digitalocean_droplet.teemo
  ]
  type = "CNAME"
  name = "autoconfig"
  value = "mail.ri-cs.nl."
}