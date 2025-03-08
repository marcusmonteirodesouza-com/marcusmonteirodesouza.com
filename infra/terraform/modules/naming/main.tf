locals {
  environment_code_map = {
    "development" = "d"
    "production"  = "p"
  }

  environment_code = lookup(local.environment_code_map, var.environment, "d")

  location_map = {
    "northamerica-northeast1" = "na-ne1"
  }

  location_abbreviation = lookup(local.location_map, var.location, null)

  name = "${local.prefix}-${var.project}-${local.environment_code}-${local.resource_abbreviation}-${local.location_abbreviation}-${var.description}-${var.suffix}"

  output_name = local.resource_abbreviation == "bqdataset" || local.resource_abbreviation == "bqtable" ? replace(local.name, "-", "_") : local.name

  prefix = "mms"

  resource_abbreviation_map = {
    "bigquery-dataset"           = "bqdataset"
    "bigquery-table"             = "bqtable"
    "bigquery-routine"           = "bqroutine"
    "bigquery-view"              = "bqview"
    "workflow"                   = "wrkflw"
    "scheduler"                  = "sch"
    "cloud-run-service"          = "run"
    "dataflow-job"               = "dataflwjob"
    "dataflow-flex-template-job" = "dataflwflexjob"
    "eventarc-trigger"           = "evtarctrigg"
    "gcs-bucket"                 = "bkt"
    "pubsub-topic"               = "pubsubtopic"
    "pubsub-subscription"        = "pubsubsubscr"
    "secret"                     = "scrt"
    "service-account"            = "sa"
  }

  resource_abbreviation = lookup(local.resource_abbreviation_map, var.resource, null)

  service_account_name = "${local.prefix}-${var.project}-${local.environment_code}-${local.resource_abbreviation}-${var.description}-${var.suffix}"
}