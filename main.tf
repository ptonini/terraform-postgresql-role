resource "postgresql_role" "this" {
  name                = var.name
  login               = var.password != null
  password            = var.password
  roles               = var.roles
  search_path         = []
  skip_reassign_owned = var.skip_reassign_owned
}

resource "postgresql_grant" "this" {
  for_each    = var.grants
  role        = postgresql_role.this.name
  database    = each.value["database"]
  privileges  = each.value["privileges"]
  schema      = try(each.value["schema"], "public")
  object_type = try(each.value["schema"], "database")
}