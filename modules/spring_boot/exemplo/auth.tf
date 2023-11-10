resource "vault_approle_auth_backend_role" "exemplo" {
  role_name      = "${var.apps_spring_boot}"
  token_policies = ["${var.apps_spring_boot}"]
}


data "vault_approle_auth_backend_role_id" "role" {
  backend   = vault_approle_auth_backend_role.exemplo.backend
  role_name = vault_approle_auth_backend_role.exemplo.role_name
}