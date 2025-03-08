locals {
  marcusmonteirodesouza_sa_project_roles = [
    "roles/logging.logWriter",
  ]
}

resource "google_service_account" "marcusmonteirodesouza" {
  project      = data.google_project.project.project_id
  account_id   = "marcusmonteirodesouza-sa"
  display_name = "marcusmonteirodesouza Service Account"
}

resource "google_project_iam_member" "marcusmonteirodesouza_sa" {
  for_each = toset(local.marcusmonteirodesouza_sa_project_roles)
  project  = data.google_project.project.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.marcusmonteirodesouza.email}"
}

resource "google_artifact_registry_repository_iam_member" "marcusmonteirodesouza_marcusmonteirodesouza_sa" {
  location   = google_artifact_registry_repository.marcusmonteirodesouza.location
  repository = google_artifact_registry_repository.marcusmonteirodesouza.name
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${google_service_account.marcusmonteirodesouza.email}"
}