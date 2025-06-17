module "project" {
  source = "../../modules/hetzner-compose-server"

  name = "backend-advanced-project"

  # Hardware configuration
  server_type = "cpx31" # x86
  location    = "hel1"  # Finland

  # Application configuration
  repo_address  = "https://github.com/LarsGJobloop/2025-06-backend-advanced-project.git"
  branch        = "main"
  compose_file  = "manifests/compose.production.yaml"
  sync_interval = "1min"
}
