output "role" {
  value = postgresql_role.this
}

output "password" {
  sensitive = true
  value     = var.login && var.password == null ? random_password.this[0].result : ""
}