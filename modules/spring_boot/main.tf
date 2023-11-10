module "exemplo" {
  apps_spring_boot            = var.apps_spring_boot[0]
  apps_name_environments      = var.apps_name_environments
  source                      = "./apps/exemplo"  
}