variable "apps_name" {
  description = "Apps Name"
  type        = list(string)
}

variable "apps_name_environments" {
  description = "Environments Aplications"
  type        = string
}

variable "app_1_url" {
  description = "Variable URL All env"
  type        = string
  default     = "https://"
}