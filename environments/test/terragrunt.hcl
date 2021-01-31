import "terragrunt_cheldren" {
  config_path = find_in_parent_folders("terragrunt_cheldren.hcl")
  deep_merge = true
}