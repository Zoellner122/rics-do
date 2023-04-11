resource "digitalocean_ssh_key" "rick-tempest" {
  name       = "Rick - Tempest (Home Desktop)"
  public_key = file("/home/rick/.ssh/id_rsa-personal.pub")
}

resource "digitalocean_ssh_key" "rick-normandy" {
  name       = "Rick - Normandy (Sue Laptop)"
  public_key = file("/home/rick/.ssh/id_rsa.pub")
}