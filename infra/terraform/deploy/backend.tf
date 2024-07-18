terraform {
  backend "gcs" {
    prefix       = "deploy"
    lock_timeout = "60m"
  }
}