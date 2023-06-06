resource "random_password" "this" {
  count = var.login && var.password == null ? 1 : 0
  length  = 16
  special = false
}

resource "postgresql_role" "this" {
  name = var.name
  login = var.login
  password = var.login ? var.password != null ? var.password : random_password.this.0.result : null
  roles = var.roles
  search_path = []
  skip_reassign_owned = var.skip_reassign_owned
}

resource "postgresql_grant" "this" {
  for_each = var.grants
  role  = postgresql_role.this.name
  database = each.value["database"]
  privileges  = each.value["privileges"]
  schema = try(each.value["schema"], "public")
  object_type = try(each.value["schema"], "database")
}