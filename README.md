# Project description
  The project consists in POC for configuration vault hashicorp with storage backend in postgres + integration keycloak with OIDC provider</br>
  The project is extension for another project, if you wanted follow this steps please see: https://github.com/guilhermelinhares/vault_ha

## Run Postgres Docker

```hcl
docker run -itd \
	--name pg-vault \
  -p 5432:5432 \
	-e POSTGRES_PASSWORD=vault \
  -e POSTGRES_DB=vault \
  -e POSTGRES_USER=vault \
	postgres
```

### Export Environments Postgres database
```hcl
export PGUSER=vault
read -s PGPASSWORD
export PGPASSWORD
terraform init
```

## Create policy for terraform apply

Run the follow command in cli vault 

block:

```hcl
vault policy write terraform - <<EOF
path "*" {
  capabilities = ["list", "read","create","update","delete"]
}

# List, create, update, and delete key/value secrets
path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Write ACL policies
path "sys/policies/acl/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

path "auth/token/create" {
capabilities = ["create", "read", "update", "list"]
}
EOF
```

## Enable approle engine

`vault auth enable approle`

## Create approle for terrraform management

Note: If the token issued by your approle needs the ability to create child tokens, you will need to set token_num_uses to 0.<br>
The secret_id_num_uses=0 option will mean that the secret id does not expire.

```hcl
vault write auth/approle/role/terraform \
  secret_id_ttl=0 \
  token_num_uses=0 \
  token_ttl=0 \
  token_max_ttl=0 \
  secret_id_num_uses=0 \
  policies="terraform"
```

## Assign the policy for approle
`vault write auth/approle/role/terraform policies=terraform`

### Get role-id and create secret-id

Save the role-id and secret-id, this values must be pass in environment variables

`vault read auth/approle/role/terraform/role-id`</br>
`vault write -f auth/approle/role/terraform/secret-id`

### Export variables role-id and secret-id
`export TF_VAR_login_approle_role_id=value`</br>
`export TF_VAR_login_approle_secret_id=value`
