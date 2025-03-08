locals {
  dockerfile_directory         = "${path.module}/../../../../../../app"
  artifact_registry_repository = "${google_artifact_registry_repository.marcusmonteirodesouza.location}-docker.pkg.dev/${google_artifact_registry_repository.marcusmonteirodesouza.project}/${google_artifact_registry_repository.marcusmonteirodesouza.name}"
  artifact_registry_image      = "${local.artifact_registry_repository}/marcusmonteirodesouza"
}

resource "google_artifact_registry_repository" "marcusmonteirodesouza" {
  location      = "northamerica-northeast1"
  repository_id = "marcusmonteirodesouza-docker-repo"
  format        = "DOCKER"
}

resource "docker_image" "marcusmonteirodesouza" {
  name = local.artifact_registry_image
  build {
    context = local.dockerfile_directory
  }
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset(local.dockerfile_directory, "**") : filesha1("${local.dockerfile_directory}/${f}")]))
  }
}

resource "docker_registry_image" "marcusmonteirodesouza" {
  name = docker_image.marcusmonteirodesouza.name

  triggers = {
    docker_image_repo_digest = docker_image.marcusmonteirodesouza.repo_digest
  }
}

