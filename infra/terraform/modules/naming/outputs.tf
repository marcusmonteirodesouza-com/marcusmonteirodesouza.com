output "name" {
  value = local.resource_abbreviation == "sa" ? local.service_account_name : local.output_name
}