locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  versionMdEx1 = local.environment_vars.locals.varsion_ModuleEx1
  config_view = read_terragrunt_config(find_in_parent_folders("config_view.hcl"))
 }

include {
  path = find_in_parent_folders()
}


terraform {
  source = "github.com/mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery/view?ref=${local.versionMdEx1}"
}

inputs = {

  credentials = local.environment_vars.locals.credentials

  dataset_id  = local.config_view.locals.dataset_id
  table_id    = local.config_view.locals.table_id
  description = local.config_view.locals.description
  query       = local.config_view.locals.query

}