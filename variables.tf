variable "address" {
  description = "Endpoint Vault"
  default     = "http://192.168.56.4:8200"
}

variable login_approle_role_id {}
variable login_approle_secret_id {}

variable "apps_ruby" {
  description = "Apps Name Ruby"
  type        = list(string)
  default     = ["ruby_1", "ruby_2", "ruby_3", "ruby_4"]
}

variable "apps_java" {
  description = "Apps Name Java"
  type        = list(string)
  default     = ["java_1", "java_2", "java_3", "java_4", "java_5"]
}

variable "apps_angular" {
  description = "Apps Name Angular"
  type        = list(string)
  default     = ["angular_1", "angular_2", "angular_3", "angular_4", "angular_5","angular_6"]
}

variable "apps_name_environments" {
  description = "Environments Aplications"
  type        = list(string)
  default     = ["dev", "tst", "hml", "sus", "ci"]
}