provider "google" {
  project = var.project_id
}

module "deploy" {
  source = "../../modules/deploy"

environment = "development"
naming_suffix = "dev"
naming_project = "marcusmonteirodesouza"
  network = "mms-shrvpchost-d-vpc-glbl-shared-dev"
  regional_config = {
    "northamerica-northeast1" = {
      subnetwork = "mms-shrvpchost-d-sb-na-ne1-default-dev"
    }
  }
}