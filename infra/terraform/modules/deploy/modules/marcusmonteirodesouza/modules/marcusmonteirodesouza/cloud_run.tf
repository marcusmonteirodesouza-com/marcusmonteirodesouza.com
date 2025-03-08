module "cloud_run_service_naming" {
  source = "../../../../../naming"

  description = "marcusmonteirodesouza"
  environment = var.environment
  location    = var.region
  project     = var.naming_project
  resource    = "cloud-run-service"
  suffix      = var.naming_suffix
}

resource "google_cloud_run_v2_service" "marcusmonteirodesouza" {
  name                = module.cloud_run_service_naming.name
  location            = var.region
  ingress             = "INGRESS_TRAFFIC_ALL"
  deletion_protection = false

  template {
    service_account = var.service_account_email

    scaling {
      # TODO(Marcus): scale to more when needed
      max_instance_count = 1
    }

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

resource "google_cloud_run_service_iam_member" "marcusmonteirodesouza_allow_unauthenticated" {
  location = google_cloud_run_v2_service.marcusmonteirodesouza.location
  project  = google_cloud_run_v2_service.marcusmonteirodesouza.project
  service  = google_cloud_run_v2_service.marcusmonteirodesouza.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}