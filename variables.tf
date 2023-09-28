variable "address" {
  description = "Endpoint Vault"
  default     = "http://192.168.56.4:8200"
}

variable login_approle_role_id {}
variable login_approle_secret_id {}

variable "apps_name" {
  description = "Apps Name"
  type        = list(string)
  default     = ["app_1", "app_2", "app_3", "app_4", "app_5","app_6"]
}

variable "apps_name_environments" {
  description = "Environments Aplications"
  type        = list(string)
  default     = ["dev", "tst", "hml", "sus", "ci"]
}