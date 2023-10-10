resource "vault_kv_secret_v2" "ruby_1_hml" {
  mount               = var.apps_ruby[0]
  name                = "${var.apps_name_environments[1]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode(
    {    
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste-tst",
      teste_2 = "1234",
      url     = "https://app_1-tst.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "ruby_2_hml" {
  mount               = var.apps_ruby[0]
  name                = "${var.apps_name_environments[2]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode(
    {    
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste-hml",
      teste_2 = "1234",
      url     = "https://app_1-hml.com.br"
    }
  )
}