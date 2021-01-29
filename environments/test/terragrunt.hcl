include {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com:mohammadlachgar/module-tf-crTables-bq.git//dry/bigquery/crTables?ref=v0.0.1"
}

inputs = {
credentials = "${get_parent_terragrunt_dir()}/serviceaccount.json"
}