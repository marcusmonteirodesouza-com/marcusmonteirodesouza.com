module "marcusmonteirodesouza" {
  source = "./modules/marcusmonteirodesouza"

  for_each = var.regional_config

  image                 = "${docker_registry_image.marcusmonteirodesouza.name}@${docker_registry_image.marcusmonteirodesouza.sha256_digest}"
  network               = var.network
  region                = each.key
  service_account_email = google_service_account.marcusmonteirodesouza.email
  subnetwork            = each.value.subnetwork

  depends_on = [
    google_artifact_registry_repository_iam_member.marcusmonteirodesouza_marcusmonteirodesouza_sa,
    google_project_iam_member.marcusmonteirodesouza_sa
  ]
}