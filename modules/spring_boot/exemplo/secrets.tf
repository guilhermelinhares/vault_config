resource "vault_kv_secret_v2" "exemplo_dev" {
  mount               = var.apps_spring_boot
  name                = "${var.apps_name_environments[0]}"
  cas                 = 0
  data_json = jsonencode(
    {
      SERVER_PORT = "8082",
      DB_SOURCE = "jdbc:postgresql://localhost:5432/vault",
      DB_USER = "vault",
      DB_PASSWORD = base64decode("dmF1bHQ="),
    }
  )
}