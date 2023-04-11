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

  depends_on = [
    digitalocean_vpc.ri-cs,
    digitalocean_ssh_key.rick-tempest
  ]

  image = "ubuntu-22-04-x64"
  size  = "s-1vcpu-2gb"

}