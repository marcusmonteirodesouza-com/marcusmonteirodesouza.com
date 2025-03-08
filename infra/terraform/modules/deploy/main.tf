module "marcusmonteirodesouza" {
  source = "./modules/marcusmonteirodesouza"

  environment     = var.environment
  naming_project  = var.naming_project
  naming_suffix   = var.naming_suffix
  network         = var.network
  regional_config = var.regional_config
}