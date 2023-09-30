terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.20.1"
    }
  }
  
  backend "pg" {
    conn_str = "postgres://localhost:5432/vault?sslmode=disable"
  }
}

module "java" {
  source = "./modules/java"
  apps_name_environments      = var.apps_name_environments
  apps_java                   = var.apps_java
}

module "ruby" {
  source = "./modules/ruby"
  apps_ruby                   = var.apps_ruby
  apps_name_environments      = var.apps_name_environments
}

module "angular" {
  source = "./modules/angular"
  apps_angular                = var.apps_angular
  apps_name_environments      = var.apps_name_environments
}