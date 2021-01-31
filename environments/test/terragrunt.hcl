# include {
#   path = find_in_parent_folders("terragrunt_cheldren.hcl")
# }


include {
file("${get_parent_terragrunt_dir()}/variables.txt")
}