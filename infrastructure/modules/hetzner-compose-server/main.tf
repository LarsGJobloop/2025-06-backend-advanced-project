locals {
  sync_script = templatefile("${path.module}/synchronize.sh", {
    application_directory = "/app",
    repo_address          = var.repo_address,
    branch                = var.branch,
    compose_file          = var.compose_file,
  })
}

locals {
  cloud_init = templatefile("${path.module}/cloud-init.yaml", {
    hostname      = "compose-app",
    sync_interval = var.sync_interval,
    sync_script   = local.sync_script
  })
}

# Used to shutup Hetzner mailing access passwords
resource "tls_private_key" "ephemeral_key" {
  algorithm = "ED25519"
}

resource "hcloud_ssh_key" "mock_key" {
  name       = "${var.name}-mock-key"
  public_key = tls_private_key.ephemeral_key.public_key_openssh
}

resource "hcloud_server" "server" {
  name = "${var.name}-server"

  server_type = var.server_type
  location    = var.location
  image       = "debian-12"

  user_data = local.cloud_init

  public_net {
    # Required due to GitHub
    ipv4_enabled = true
    # Disabled to reduce amount of resources (even if it's free)
    ipv6_enabled = false
  }

  ssh_keys = [
    hcloud_ssh_key.mock_key.id,
  ]
}
