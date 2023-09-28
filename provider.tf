#https://registry.terraform.io/providers/hashicorp/vault/latest/docs?ajs_aid=29013c98-1c74-4afd-b0e3-beee60535e43&product_intent=terraform&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS#provider-arguments
provider "vault" {
    address = var.address
    skip_child_token = true

    auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }
}