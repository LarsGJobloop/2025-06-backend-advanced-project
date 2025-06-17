output "compose_app" {
  description = "Essential application information"
  value = {
    public_addresses = {
      ipv4_address = hcloud_server.server.ipv4_address
      ipv6_address = hcloud_server.server.ipv6_address
    }
  }
}

output "cost_estimation" {
  description = "Estimated cost for system"
  value = {
    monthly_roof     = "NOT YET IMPLEMENTED"
    monthly_estimate = "NOT YET IMPLEMENTED"
    yearly_roof      = "NOT YET IMPLEMENTED"
    yearly_estimate  = "NOT YET IMPLEMENTED"
  }
}
