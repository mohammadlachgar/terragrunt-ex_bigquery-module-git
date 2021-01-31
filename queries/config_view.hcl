locals {

dataset_id = "dataset_ex2"
table_id = "table4_view_10"
description = "My example view"

#path
query = "${find_in_parent_folders("/")}/queries/create_this_view.sql"

}
