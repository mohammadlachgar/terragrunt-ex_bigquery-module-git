locals {

dataset_id = "dataset_ex2"
table_id = "table4_view_3"
description = "My example view"

#path
query = "${get_parent_terragrunt_dir()}/query.sql"

}
