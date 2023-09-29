#[Angular_1]
  #Render template angular_1
  data "template_file" "template_angular_1" {  
    template = templatefile("${path.module}/templates/${var.apps_angular[0]}.json.tftpl", 
      { 
        passwd = base64decode("SGVsbG8gV29ybGQ="),
        teste   = "teste",
        teste_2 = 1234,
        url     = "https://angular_1-tst.com.br"
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
#[endregion - Angular1]

#[Angular_2]
  #Render template angular_2
  data "template_file" "template_angular_2" {  
    template = templatefile("${path.module}/templates/${var.apps_angular[1]}.json.tftpl", 
      { 
        passwd = base64decode("SGVsbG8gV29ybGQ="),
        teste   = "teste",
        teste_2 = 1234,
        url     = "https://angular_2-tst.com.br"
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
#[endregion - Angular_2]

#[Angular_3]
  #Render template angular_2
  data "template_file" "template_angular_3" {  
    template = templatefile("${path.module}/templates/${var.apps_angular[2]}.json.tftpl", 
      { 
        passwd = base64decode("SGVsbG8gV29ybGQ="),
        teste   = "teste",
        teste_2 = 1234,
        url     = "https://angular_3-tst.com.br"
      }
    )
  }

  resource "vault_kv_secret_v2" "angular_3" {
    mount               = var.apps_angular[2]
    name                = "${var.apps_name_environments}"
    cas                 = 0
    delete_all_versions = true
    data_json = data.template_file.template_angular_3.rendered
  }
#[endregion - Angular_3]