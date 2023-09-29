module "secrets_ruby_tst" {
  apps_ruby                   = var.apps_ruby
  apps_name_environments      = var.apps_name_environments[1]
  source                      = "./secrets/tst"  
}

module "secrets_ruby_hml" {
  apps_ruby                   = var.apps_ruby
  apps_name_environments      = var.apps_name_environments[2]
  source                      = "./secrets/hml"  
}

module "secrets_ruby_sus" {
  apps_ruby                   = var.apps_ruby
  apps_name_environments      = var.apps_name_environments[3]
  source                      = "./secrets/sus"  
}

module "secrets_ruby_ci" {
  apps_ruby                   = var.apps_ruby
  apps_name_environments      = var.apps_name_environments[4]
  source                      = "./secrets/ci"  
}