locals {
  all_apps = concat(var.apps_ruby, var.apps_java, var.apps_angular)
}