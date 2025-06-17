# Meta configuration
variable "name" {
  description = "The name of the application"
  sensitive   = false
  type        = string
}

variable "tags" {
  description = "Annotation to use for the resource"
  sensitive   = false
  type        = list(string)
  default     = []
}

# Hardware configuration
variable "server_type" {
  description = "The server size"
  sensitive   = false
  type        = string
}

variable "location" {
  description = "The location of the server"
  sensitive   = false
  type        = string
}

# Compose Application Configuration
variable "repo_address" {
  description = "Address to the Git repository"
  sensitive   = false
  type        = string
}

variable "branch" {
  description = "The branch to target"
  sensitive   = false
  type        = string
}

variable "compose_file" {
  description = "The path to the Compose file to use."
  sensitive   = false
  type        = string
}

variable "sync_interval" {
  description = "The time between source synchronizations"
  sensitive   = false
  type        = string
}
