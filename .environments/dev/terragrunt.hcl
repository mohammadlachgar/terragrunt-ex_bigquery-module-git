locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  # versionMdEx1 = local.environment_vars.locals.varsion_ModuleEx1
  path_config_view = "${find_in_parent_folders("../")}/queries/config_view.hcl"
  config_view = read_terragrunt_config(local.path_config_view)
  path_config_crtables = "${find_in_parent_folders("../")}/create_this_tables_schema/config_crtables.hcl"
  config_crtables = read_terragrunt_config(local.path_config_crtables)
 }

include {
  path = find_in_parent_folders()
}


terraform {
  source = local.environment_vars.locals. source_module-tf-crTables-bq
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