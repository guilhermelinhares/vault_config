#Render template java_1
data "template_file" "template_java_1" {  
  template = templatefile("${path.module}/templates/${var.apps_java[0]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://java_1-sus.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "java_1" {
  mount               = var.apps_java[0]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_java_1.rendered
}

#Render template java_2
data "template_file" "template_java_2" {  
  template = templatefile("${path.module}/templates/${var.apps_java[1]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://java_2-sus.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "java_2" {
  mount               = var.apps_java[1]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_java_2.rendered
}