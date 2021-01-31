locals {
dataset_id = "burnished-case-280710.dataset_ex2"
table_id = "table4"
query_file = "${get_parent_terragrunt_dir()}/query.sql"
description = "My example view"
}
