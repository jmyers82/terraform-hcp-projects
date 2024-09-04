resource "hcp_project" "new_project" {
  name = var.project_name
}

#####################################################
# Create a service principal for the project as owner
#####################################################
resource "hcp_service_principal" "project_spn" {
  name   = "spn-${hcp_project.new_project.resource_name}"
  parent = hcp_project.new_project.resource_name
}

resource "hcp_service_principal_role_assignment" "project_owner" {
  service_principal_id = hcp_service_principal.project_spn.id
  role_id             = "admin"
  project_id          = hcp_project.new_project.id
}

