resource "google_cloud_run_v2_service" "marcusmonteirodesouza" {
  name                = module.cloud_run_service_naming.name
  location            = var.region
  ingress             = "INGRESS_TRAFFIC_ALL"
  deletion_protection = false

  template {
    service_account = var.service_account_email

    containers {
      image = var.image

      env {
        name  = "HOSTNAME"
        value = "0.0.0.0"
      }

      env {
        name  = "NODE_ENV"
        value = "production"
      }
    }

    vpc_access {
      network_interfaces {
        network    = var.network
        subnetwork = var.subnetwork
      }
      egress = "ALL_TRAFFIC"
    }
  }
}