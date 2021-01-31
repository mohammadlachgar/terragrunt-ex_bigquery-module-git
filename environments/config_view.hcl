locals {
dataset_id = "dataset_ex2"
table_id = "table4_view_2"
query = file("${get_parent_terragrunt_dir()}/query.sql")
#Or create query
#query = <<EOF
#SELECT *  FROM `burnished-case-280710.dataset_ex2.table4` LIMIT 1000;
#EOF
description = "My example view"
}
