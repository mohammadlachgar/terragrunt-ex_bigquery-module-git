include {
  path = find_in_parent_folders()
}
locals {
  versionModule     = var.versionModule

terraform {
  source = "github.com/mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery?ref=${local.versionModule}"
}

inputs = {
credentials = "${get_parent_terragrunt_dir()}/serviceaccount.json"
}