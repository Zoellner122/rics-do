/* resource "digitalocean_droplet" "braum" {
  name     = "braum"
  vpc_uuid = digitalocean_vpc.ri-cs.id
  ssh_keys = [digitalocean_ssh_key.rick-tempest.id, digitalocean_ssh_key.rick-normandy.id]

  depends_on = [
    digitalocean_vpc.ri-cs,
    digitalocean_ssh_key.rick-tempest
  ]

  image = "devrel-teleport-20-04"
  size  = "s-1vcpu-2gb"
} */

resource "digitalocean_droplet" "teemo" {
  name     = "teemo"
  vpc_uuid = digitalocean_vpc.ri-cs.id
  ssh_keys = [digitalocean_ssh_key.rick-tempest.id, digitalocean_ssh_key.rick-normandy.id]
  ipv6     = true
  region   = var.do_region
  depends_on = [
    digitalocean_vpc.ri-cs,
    digitalocean_ssh_key.rick-tempest
  ]

  image         = "almalinux-8-x64"
  size          = "s-1vcpu-2gb"
  droplet_agent = true
}

resource "digitalocean_reserved_ip" "teemo-ip" {
  droplet_id = digitalocean_droplet.teemo.id
  region     = "ams3"
}