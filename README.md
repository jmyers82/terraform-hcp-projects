# terraform-hcp-projects
Create new projects in hcp cloud

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.96.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.58.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcp_project.new_project](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/project) | resource |
| [hcp_project_iam_binding.owner](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/project_iam_binding) | resource |
| [hcp_project_iam_binding.secrets_app_manager](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/project_iam_binding) | resource |
| [hcp_service_principal.project_spn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/service_principal) | resource |
| [hcp_service_principal_key.project_spn_key](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/service_principal_key) | resource |
| [tfe_project.app_specific_project](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project_variable_set.app_specific_var_set](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |
| [tfe_variable.app_specific_client_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.app_specific_client_secret](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.app_specific_organization_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.app_specific_project_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.app_specific_var_set](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_organization.tf_org](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_TFE_TOKEN_TFE"></a> [TFE\_TOKEN\_TFE](#input\_TFE\_TOKEN\_TFE) | The Terraform Cloud API token | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the project. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project in which the vault secrets app(s) will be created. | `string` | n/a | yes |
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | value of the TFE organization | `string` | `"hashiconf22"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | n/a |
| <a name="output_project_spn"></a> [project\_spn](#output\_project\_spn) | n/a |
<!-- END_TF_DOCS -->