# resource "hcp_waypoint_tfc_config" "tfe_config" {
#   token        = var.TFE_TOKEN_TFE
#   tfc_org_name = var.tfe_organization
# }

# resource "hcp_waypoint_template" "app_specific_template" {
#   name                            = "${hcp_project.new_project.resource_name}-app-creator"
#   description                     = "Create Vault Secrets Apps in the ${hcp_project.new_project.name} project."
#   project_id                      = hcp_project.new_project.resource_id
#   summary                         = "Create Vault Secrets Apps in the ${hcp_project.new_project.name} project."
#   terraform_no_code_module_source = "hashiconf22/vault-secrets-apps"
#   terraform_project_id            = tfe_project.app_specific_project.id
#   depends_on = [ hcp_waypoint_tfc_config.tfe_config ]
# }