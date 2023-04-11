resource "digitalocean_firewall" "mx-server(s)" {
  name        = "Firewall - MX machines (mailcow based)"
  droplet_ids = [digitalocean_droplet.teemo.id]

  # Temporary SSH rules (remove when teleport is implemented)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["213.154.248.139/32", "77.169.152.88/32", "2a02:a465:159d::/48"]
  }

  # Mail-Server rules
  inbound_rule {
    protocol         = "tcp"
    port_range       = "25"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "465"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "587"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "143"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "993"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "110"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "995"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "4190"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::0/"]
  }


  outbound_rule {
    protocol              = "tcp"
    port_range            = "25"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "465"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "587"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "143"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "993"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "110"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "995"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "4190"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::0/"]
  }

}