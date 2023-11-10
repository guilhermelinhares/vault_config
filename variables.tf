variable "address" {
  description = "Endpoint Vault"
  default     = "http://vault:8200"
}

variable login_approle_role_id {
  description = "Role ID - Terraform"
  type        = string
  default     = "change-it"
}

variable login_approle_secret_id {}

variable "apps_name_environments" {
  description = "Environments Aplications"
  type        = list(string)
  default     = ["dev", "tst", "hml", "sus", "ci"]
}

#region - Tecnologies
  variable "apps_ruby" {
    description = "Apps Name Ruby"
    type        = list(string)
    default     = ["ruby_1"]
  }

  variable "apps_spring_boot" {
    description = "Apps Name Spring Boot"
    type        = list(string)
    default     = ["exemplo"]
  }

  variable "apps_angular" {
    description = "Apps Name Angular"
    type        = list(string)
    default     = ["angular_1"]
  }
#endregion

#region - Auth Methods
  variable "oidc_apps" {
    description = "OIDC Aplications"
    type        = list(string)
    default     = ["keycloak"]
  }
#endregion

#region - Keycloak 
  variable "sso_address" {
    description = "Endpoint Keycloak"
    default     = "http://keycloak:8080"
  }

  variable "sso_username" {
    type    = string
    default = "root"
  }

  variable "sso_password" {
    type    = string
    default = "root"
  }

#endregion