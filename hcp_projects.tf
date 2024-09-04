resource "hcp_project" "new_project" {
  name = var.project_name
}

#####################################################
# Create a service principal for the project as admin
#####################################################
resource "hcp_service_principal" "project_spn" {
  name   = "spn-${hcp_project.new_project.resource_name}"
  parent = hcp_project.new_project.resource_name
}


resource "hcp_project_iam_binding" "project_owner" {
  project_id   = hcp_project.new_project.resource_id
  principal_id = hcp_service_principal.project_spn.resource_id
  role         = "roles/admin"
}

