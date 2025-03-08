variable "description" {
  type        = string
  description = "Short description without spaces."
}

variable "environment" {
  type        = string
  description = "Environment name (alpha, beta, production)."
}

variable "location" {
  type        = string
  description = "Resource location."
}

variable "project" {
  type        = string
  description = "Project short description without spaces. "
}

variable "resource" {
  type        = string
  description = "Resource type."
}

variable "suffix" {
  type        = string
  description = "Suffix to add to resource names."
}