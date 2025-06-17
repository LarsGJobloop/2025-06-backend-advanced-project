terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.51"
    }
  }
}

provider "hcloud" {
  token = var.HETZNER_TOKEN
}
