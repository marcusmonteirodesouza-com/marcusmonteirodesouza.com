provider "google" {
  project = var.project_id
}

module "deploy" {
  source = "../../modules/deploy"

  environment    = "development"
  naming_suffix  = "dev"
  naming_project = "marcusmonteirodesouza"
  network        = "mms-shrvpchost-d-vpc-glbl-shared-dev"
  regional_config = {
    # TODO(Marcus): Change to northamerica-northeast1 when Custom Domain Mapping becomes available https://cloud.google.com/run/docs/mapping-custom-domains#run
    "us-central1" = {
      subnetwork = "mms-shrvpchost-d-sb-us-ctl1-default-dev"
    }
  }
}