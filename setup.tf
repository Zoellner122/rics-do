provider "digitalocean" {
  token = var.do_token
}

variable "do_region" {
  description = "Region where a resource (e.g. Droplet) should land in"
  default     = "ams3"
  type        = string
}