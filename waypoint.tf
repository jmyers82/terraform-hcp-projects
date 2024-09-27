## Add in a wait to allow new project to be created
resource "time_sleep" "wait_60_seconds" {
  depends_on = [hcp_project.new_project]

  create_duration = "60s"
}

resource "hcp_waypoint_tfc_config" "tfe_config" {
  token        = var.tfe_token_tfe
  tfc_org_name = var.tfe_organization
  project_id   = hcp_project.new_project.resource_id
  depends_on = [ time_sleep.wait_60_seconds ]
}

resource "hcp_waypoint_template" "app_specific_template" {
  name                            = "${hcp_project.new_project.resource_name}-app-creator"
  description                     = "Create Vault Secrets Apps in the ${hcp_project.new_project.name} project."
  project_id                      = hcp_project.new_project.resource_id
  summary                         = "Create Vault Secrets Apps in the ${hcp_project.new_project.name} project."
  terraform_no_code_module_source = "hashiconf22/vault-secrets-apps"
  terraform_project_id            = tfe_project.app_specific_project.id
  depends_on                      = [hcp_waypoint_tfc_config.tfe_config]
}