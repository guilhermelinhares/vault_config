#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------

# Enable K/V v2 secrets engine at 'kv-v2'
resource "vault_mount" "kv-apps" {
  count = length(var.apps_name) 
  path  = var.apps_name[count.index]
  type  = "kv-v2"
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "apps_dev" {
  depends_on          = [vault_mount.kv-apps]
  count               = length(var.apps_name) 
  mount               = "${format("%s", element(var.apps_name, count.index))}"
  name                = "${var.apps_name_environments[0]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode({})
}

resource "vault_kv_secret_v2" "apps_tst" {
  depends_on          = [vault_mount.kv-apps]
  count               = length(var.apps_name) 
  mount               = "${format("%s", element(var.apps_name, count.index))}"
  name                = "${var.apps_name_environments[1]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode({})
}

resource "vault_kv_secret_v2" "apps_hml" {
  depends_on          = [vault_mount.kv-apps]
  count               = length(var.apps_name) 
  mount               = "${format("%s", element(var.apps_name, count.index))}"
  name                = "${var.apps_name_environments[2]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode({})
}

resource "vault_kv_secret_v2" "apps_sus" {
  depends_on          = [vault_mount.kv-apps]
  count               = length(var.apps_name) 
  mount               = "${format("%s", element(var.apps_name, count.index))}"
  name                = "${var.apps_name_environments[3]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode({})
}

resource "vault_kv_secret_v2" "apps_ci" {
  depends_on          = [vault_mount.kv-apps]
  count               = length(var.apps_name) 
  mount               = "${format("%s", element(var.apps_name, count.index))}"
  name                = "${var.apps_name_environments[4]}"
  cas                 = 0
  delete_all_versions = true
  data_json = jsonencode({})
}