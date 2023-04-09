terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    }
  }

  backend "remote" {
    organization = "ri-cs"
    workspaces {
      name = "ri-cs"
    } 
  }
}

resource "digitalocean_project" "ri-cs" {
    name        = "ri-cs"
    description = "The default Ri-CS project"
    environment = "Production"
}