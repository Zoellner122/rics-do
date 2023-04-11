terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
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
  name       = "ri-cs"
  is_default = true

  purpose     = "Other"
  description = "The default Ri-CS project"
  environment = "Production"
}

resource "digitalocean_vpc" "ri-cs" {
  name   = "ri-cs"
  region = "ams3"

  ip_range = "10.100.0.0/20"
}