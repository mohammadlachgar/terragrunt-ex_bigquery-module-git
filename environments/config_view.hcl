locals {
dataset_id = "dataset_ex2"
table_id = "table4_view_3"
query = file("${get_parent_terragrunt_dir()}/query.sql")
description = "My example view"
}
