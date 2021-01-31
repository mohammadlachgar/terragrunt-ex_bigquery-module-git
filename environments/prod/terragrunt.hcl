locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  versionMdEx1 = local.environment_vars.locals.varsion_ModuleEx1
}

include {
  path = find_in_parent_folders()
}

terraform {
 source = "github.com/mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery?ref=${local.versionMdEx1}"
}

inputs = {
credentials = "${get_parent_terragrunt_dir()}/serviceaccount.json"
}