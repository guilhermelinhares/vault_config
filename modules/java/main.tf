module "secrets_java_tst" {
  apps_java                   = var.apps_java
  apps_name_environments      = var.apps_name_environments[1]
  source                      = "./secrets/tst"  
}

module "secrets_java_hml" {
  apps_java                   = var.apps_java
  apps_name_environments      = var.apps_name_environments[2]
  source                      = "./secrets/hml"  
}

module "secrets_java_sus" {
  apps_java                   = var.apps_java
  apps_name_environments      = var.apps_name_environments[3]
  source                      = "./secrets/sus"  
}

module "secrets_java_ci" {
  apps_java                   = var.apps_java
  apps_name_environments      = var.apps_name_environments[4]
  source                      = "./secrets/ci"  
}