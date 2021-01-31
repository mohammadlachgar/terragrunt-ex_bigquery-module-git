locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  versionMdEx1 = local.environment_vars.locals.varsion_ModuleEx1
  path_create_this_view = "${find_in_parent_folders("../")}/queries/create_this_view.sql"
  config_view = read_terragrunt_config(local.path_create_this_view)
  config_crtables = read_terragrunt_config(find_in_parent_folders("config_crtables.hcl"))
 }

include {
  path = find_in_parent_folders()
}


terraform {
  source = "github.com/mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery?ref=${local.versionMdEx1}"
}


inputs = {

  credentials = local.environment_vars.locals.credentials

  #crTables
  folder_tables_schema = local.config_crtables.locals.folder_tables_schema

  #view
  dataset_id  = local.config_view.locals.dataset_id
  table_id    = local.config_view.locals.table_id
  description = local.config_view.locals.description
  query       = local.config_view.locals.query

}