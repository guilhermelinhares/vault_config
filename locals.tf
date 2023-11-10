locals {
  all_apps = concat(var.apps_ruby, var.apps_spring_boot, var.apps_angular)

  policies_groups = [vault_policy.codificadores_policy.name,vault_policy.devops_policy.name]
}