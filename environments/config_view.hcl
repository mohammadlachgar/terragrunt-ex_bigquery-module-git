locals {

dataset_id = "dataset_ex2"
table_id = "table4_view_3"
description = "My example view"

#path
#query = "${get_parent_terragrunt_dir("cmd.sh")}/query.sql"
query = "${find_in_parent_folders("/")}/query.sql"

}
