output "project" {
  description = "Essential application information"
  value       = module.project.compose_app
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
