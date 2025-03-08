variable "environment" {
  type        = string
  description = "Environment name (alpha, beta, production)."
}

variable "naming_project" {
  type = string
  description = "Project short description without spaces. "
}

variable "naming_suffix" {
  type        = string
  description = "Suffix to add to resource names."
}

variable "network" {
  type = string
  description = "The VPC network."
}

variable "regional_config" {
  type = map(object({
    subnetwork = string
  }))
  description = "Regional configuration."
}