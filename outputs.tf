output "project_name" {
    value = hcp_project.new_project.name
}

output "project_spn" {
    value = hcp_service_principal.project_spn.name
}