locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  versionMdEx1 = local.environment_vars.locals.varsion_ModuleEx1
  config_crtables = read_terragrunt_config(find_in_parent_folders("config_crtables.hcl"))
}

include {
  path = find_in_parent_folders()
}


terraform {
  source = "github.com/mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery/crTables?ref=${local.versionMdEx1}"
}




inputs = {
  
  credentials = local.environment_vars.locals.credentials

  folder_tables_schema = local.config_crtables.locals.folder_tables_schema

}