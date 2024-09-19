


resource "tfe_project" "app_specific_project" {
  organization = var.tfe_organization
  name = lower("${var.project_name}-project")
}

resource "tfe_variable_set" "app_specific_var_set" {
  name         = lower("${var.project_name}-varset")
  description  = "Auth Vars for ${var.project_name} vault secrets app."
  organization = var.tfe_organization
}

resource "tfe_project_variable_set" "app_specific_var_set" {
  variable_set_id = tfe_variable_set.app_specific_var_set.id
  project_id      = tfe_project.app_specific_project.id
}

resource "tfe_variable" "app_specific_client_id" {
  key             = "HCP_CLIENT_ID"
  value           = hcp_service_principal_key.project_spn_key.client_id
  category        = "env"
  description     = "Client ID for the HCP Service Principal"
  variable_set_id = tfe_variable_set.app_specific_var_set.id
}

resource "tfe_variable" "app_specific_client_secret" {
  key             = "HCP_CLIENT_SECRET"
  value           = hcp_service_principal_key.project_spn_key.client_secret
  category        = "env"
  description     = "HCP Service Principal Client Secret"
  variable_set_id = tfe_variable_set.app_specific_var_set.id
}

resource "tfe_variable" "app_specific_organization_id" {
  key             = "ORGANIZATION_ID"
  value           = data.tfe_organization.tf_org.id
  category        = "env"
  description     = "HCP Organization ID"
  variable_set_id = tfe_variable_set.app_specific_var_set.id
}

resource "tfe_variable" "app_specific_project_id" {
  key             = "PROJECT_ID "
  value           = tfe_project.app_specific_project.id
  category        = "env"
  description     = "PROJECT_ID"
  variable_set_id = tfe_variable_set.app_specific_var_set.id
}

jmyers82/terraform-hcp-projects