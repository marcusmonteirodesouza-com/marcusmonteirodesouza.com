variable "network" {
  type        = string
  description = "The VPC network."
}

variable "regional_config" {
  type = map(object({
    subnetwork = string
  }))
  description = "Regional configuration."
}