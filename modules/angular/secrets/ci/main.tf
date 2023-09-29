#Render template angular_1
data "template_file" "template_angular_1" {  
  template = templatefile("${path.module}/templates/${var.apps_angular[0]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://app_1-ci.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "angular_1" {
  mount               = var.apps_angular[0]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_angular_1.rendered
}

#Render template angular_2
data "template_file" "template_angular_2" {  
  template = templatefile("${path.module}/templates/${var.apps_angular[1]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://app_2-ci.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "angular_2" {
  mount               = var.apps_angular[1]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_angular_2.rendered
}