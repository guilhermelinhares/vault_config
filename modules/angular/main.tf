module "secrets_angular_tst" {
  apps_angular                = var.apps_angular
  apps_name_environments      = var.apps_name_environments[1]
  source                      = "./secrets/tst"  
}

module "secrets_angular_hml" {
  apps_angular                = var.apps_angular
  apps_name_environments      = var.apps_name_environments[2]
  source                      = "./secrets/hml"  
}

module "secrets_angular_sus" {
  apps_angular                = var.apps_angular
  apps_name_environments      = var.apps_name_environments[3]
  source                      = "./secrets/sus"  
}

module "secrets_angular_ci" {
  apps_angular                = var.apps_angular
  apps_name_environments      = var.apps_name_environments[4]
  source                      = "./secrets/ci"  
}