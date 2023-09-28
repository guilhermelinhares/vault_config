output "kv_apps_id" {
  value = {
    for k, v in vault_mount.kv-apps : k => v.id
  }
}

output "apps_dev_path" {
  value = {
    for k, v in vault_kv_secret_v2.apps_dev : k => v.path
  }
}

output "apps_tst_path" {
  value = {
    for k, v in vault_kv_secret_v2.apps_tst : k => v.path
  }
}

output "apps_hml_path" {
  value = {
    for k, v in vault_kv_secret_v2.apps_hml : k => v.path
  }
}

output "apps_sus_path" {
  value = {
    for k, v in vault_kv_secret_v2.apps_sus : k => v.path
  }
}