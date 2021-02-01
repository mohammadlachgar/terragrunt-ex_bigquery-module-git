locals {
  credentials = "${get_parent_terragrunt_dir()}/.serviceaccount.json"
  varsion_ModuleEx1 = "v0.0.94"
  source_module-tf-crTables-bq="git::git@github.com:mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery?ref=${local.versionMdEx1}"
}