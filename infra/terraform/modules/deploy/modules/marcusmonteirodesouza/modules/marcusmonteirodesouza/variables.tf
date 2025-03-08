variable "image" {
  type        = string
  description = "URL of the Container image in Google Artifact Registry."
}

variable "network" {
  type        = string
  description = "The VPC network."
}

variable "region" {
  type        = string
  description = "Region to create the resources in."
}

variable "service_account_email" {
  type        = string
  description = "Email address of the IAM service account used to run the services."
}

variable "subnetwork" {
  type        = string
  description = "The VPC subnetwork."
}
