locals {
dataset_id = "dataset_ex2"
table_id = "table4"
query = "${get_parent_terragrunt_dir()}/query.sql"
description = "My example view"
}
