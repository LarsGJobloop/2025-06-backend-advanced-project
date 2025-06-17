terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.51"
    }

    # Used for generating ephemeral SSH keys
    # SECURITY! Stores certificates in statefiles, don't rely on it
    # https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
  }
}
