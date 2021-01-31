locals {
dataset_id = "dataset_ex2"
table_id = "table4_view"
#query = "${get_parent_terragrunt_dir()}/query.sql"
query = <<EOF
SELECT *  FROM `burnished-case-280710.dataset_ex2.table4` LIMIT 1000;
EOF
description = "My example view"
}
