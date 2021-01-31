locals {

#folder_tables_schema = "${find_in_parent_folders("/")}/create_this_tables_schema"
folder_tables_schema = "${get_terragrunt_dir()}/tables_schema"
 
}