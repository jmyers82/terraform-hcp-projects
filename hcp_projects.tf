resource "hcp_project" "new_project" {
  name = lower(var.project_name)
}

#####################################################
# Create a service principal for the project as admin
#####################################################
resource "hcp_service_principal" "project_spn" {
  name   = "vault-secrets-app-manager"
  parent = hcp_project.new_project.resource_name
}


resource "hcp_project_iam_binding" "secrets_app_manager" {
  project_id   = hcp_project.new_project.resource_id
  principal_id = hcp_service_principal.project_spn.resource_id
  role         = "roles/secrets.app-manager"
}

# required to create spn in new project for each app
resource "hcp_project_iam_binding" "owner" {
  project_id   = hcp_project.new_project.resource_id
  principal_id = hcp_service_principal.project_spn.resource_id
  role         = "roles/admin"
}

resource "hcp_service_principal_key" "project_spn_key" {
  service_principal = hcp_service_principal.project_spn.resource_name
}

