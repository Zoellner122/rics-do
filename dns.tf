resource "digitalocean_domain" "romanoffindustries" {
  name = "romanoffindustries.nl"
}

resource "digitalocean_domain" "ri-cs" {
  name = "ri-cs.nl"
}

resource "digitalocean_record" "teemo_mx" {
  domain   = digitalocean_domain.ri-cs.id
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "mail.ri-cs.nl."
}

resource "digitalocean_record" "teemo_a" {
  domain = digitalocean_domain.ri-cs.id
  type   = "A"
  name   = join(".", [digitalocean_droplet.teemo.name, digitalocean_domain.ri-cs.name])
  value  = digitalocean_droplet.teemo.ipv4_address
}

resource "digitalocean_record" "teemo_cname" {
  domain = digitalocean_domain.ri-cs.id
  type   = "CNAME"
  name   = "mail.ri-cs.nl"
  value  = "teemo.ri-cs.nl"
}

resource "digitalocean_record" "teemo_aaaa" {
  domain = digitalocean_domain.ri-cs.id
  type   = "AAAA"
  name   = join(".", [digitalocean_droplet.teemo.name, digitalocean_domain.ri-cs.name])
  value  = digitalocean_droplet.teemo.ipv6_address
}