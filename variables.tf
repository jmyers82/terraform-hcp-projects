variables {
  name = "project_name"
  type = "string"
  description = "The name of the project in which the vault secrets app(s) will be created."

  validation {
    condition     = length(var.project_name) < 40
    error_message = "The project name must be less than 40 characters"
  }
  validation {
    condition     = length(var.project_name) > 3
    error_message = "The project name must be greater than 3 characters"
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]*$", var.project_name))
    error_message = "The project name must contain only alphanumeric characters and dashes"
  }
  validation {
    condition     = can(regex("^[a-zA-Z].+", var.project_name))
    error_message = "The project name must start with an alpha character"
  }
}

variable "description" {
  type        = string
  description = "The description of the project."

  validation {
    condition     = length(var.description) > 0
    error_message = "The description must not be empty"
  }
  validation {
    condition     = length(var.description) < 256
    error_message = "The description must be less than 256 characters"
  }
}
