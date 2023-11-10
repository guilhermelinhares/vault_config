terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.20.1"
    }
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
  
  backend "pg" {
   conn_str = "postgres://localhost:5432/vault?sslmode=disable"
  }
}

module "auth" {
  source = "./modules/auth"
  depends_on                  = [
    vault_mount.kv-apps, 
    vault_kv_secret_v2.apps_tst, 
    vault_kv_secret_v2.apps_hml, 
    vault_kv_secret_v2.apps_sus,
    vault_kv_secret_v2.apps_ci,
    vault_policy.codificadores_policy,
    vault_policy.devops_policy,
    keycloak_openid_client.openid_client
  ]
  oidc_apps                   = var.oidc_apps
  sso_address                 = var.sso_address
  address                     = var.address
  keycloak_realm_id           = data.keycloak_realm.realm.id
  client_id                   = keycloak_openid_client.openid_client.client_id
  client_secret               = keycloak_openid_client.openid_client.client_secret
  policy_codificadores        = vault_policy.codificadores_policy
  policy_devops               = vault_policy.devops_policy
  policies_groups             = local.policies_groups
}

module "spring_boot" {
  source = "./modules/spring_boot"
  depends_on                  = [
    vault_mount.kv-apps, 
    vault_kv_secret_v2.apps_tst, 
    vault_kv_secret_v2.apps_hml, 
    vault_kv_secret_v2.apps_sus,
    vault_kv_secret_v2.apps_ci
  ]
  apps_name_environments      = var.apps_name_environments
  apps_spring_boot            = var.apps_spring_boot
}

# module "ruby" {
#   source = "./modules/ruby"
#   depends_on                  = [
#     vault_mount.kv-apps, 
#     vault_kv_secret_v2.apps_tst, 
#     vault_kv_secret_v2.apps_hml, 
#     vault_kv_secret_v2.apps_sus,
#     vault_kv_secret_v2.apps_ci
#   ]
#   apps_ruby                   = var.apps_ruby
#   apps_name_environments      = var.apps_name_environments
# }

# module "angular" {
#   source = "./modules/angular"
#   depends_on                  = [
#     vault_mount.kv-apps, 
#     vault_kv_secret_v2.apps_tst, 
#     vault_kv_secret_v2.apps_hml, 
#     vault_kv_secret_v2.apps_sus,
#     vault_kv_secret_v2.apps_ci
#   ]
#   apps_angular                = var.apps_angular
#   apps_name_environments      = var.apps_name_environments
# }