#Render template apps_1
data "template_file" "template_app_1" {  
  template = templatefile("${path.module}/templates/${var.apps_name[0]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://app_1-sus.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "app_1" {
  mount               = var.apps_name[0]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_app_1.rendered
}

#Render template apps_1
data "template_file" "template_app_2" {  
  template = templatefile("${path.module}/templates/${var.apps_name[1]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://app_2-sus.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "app_2" {
  mount               = var.apps_name[1]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_app_1.rendered
}