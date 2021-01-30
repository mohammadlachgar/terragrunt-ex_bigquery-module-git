include {
  path = find_in_parent_folders()
}


terraform {
  source = "github.com/mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery?ref=${var.versionModule}"
}

inputs = {
credentials = "${get_parent_terragrunt_dir()}/serviceaccount.json"
}