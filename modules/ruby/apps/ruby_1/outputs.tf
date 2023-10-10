# output "secrets" {
#   value = {
#     for k, v in vault_kv_secret_v2.ruby_1_tst : k => v.data_json
#   }
# }