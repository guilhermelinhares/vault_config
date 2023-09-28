terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.20.1"
    }
  }
}

module "secrets_apps_tst" {
  apps_name                   = var.apps_name
  apps_name_environments      = var.apps_name_environments[1]
  source                      = "./modules/secrets/tst"  
}

module "secrets_apps_hml" {
  apps_name                   = var.apps_name
  apps_name_environments      = var.apps_name_environments[2]
  source                      = "./modules/secrets/hml"  
}


module "secrets_apps_sus" {
  apps_name                   = var.apps_name
  apps_name_environments      = var.apps_name_environments[3]
  source                      = "./modules/secrets/sus"  
}

module "secrets_apps_ci" {
  apps_name                   = var.apps_name
  apps_name_environments      = var.apps_name_environments[4]
  source                      = "./modules/secrets/ci"  
}