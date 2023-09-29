#Render template ruby_1
data "template_file" "template_ruby_1" {  
  template = templatefile("${path.module}/templates/${var.apps_ruby[0]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://ruby_1-sus.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "ruby_1" {
  mount               = var.apps_ruby[0]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_ruby_1.rendered
}

#Render template ruby_2
data "template_file" "template_ruby_2" {  
  template = templatefile("${path.module}/templates/${var.apps_ruby[1]}.json.tftpl", 
    { 
      passwd = base64decode("SGVsbG8gV29ybGQ="),
      teste   = "teste",
      teste_2 = 1234,
      url     = "https://ruby_2-sus.com.br"
    }
  )
}

resource "vault_kv_secret_v2" "ruby_2" {
  mount               = var.apps_ruby[1]
  name                = "${var.apps_name_environments}"
  cas                 = 0
  delete_all_versions = true
  data_json = data.template_file.template_ruby_2.rendered
}