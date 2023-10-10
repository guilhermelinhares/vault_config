module "ruby_1" {
  apps_ruby                   = var.apps_ruby
  apps_name_environments      = var.apps_name_environments
  source                      = "./apps/ruby_1"  
}