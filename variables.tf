variable "name" {}

variable "login" {
  default = false
}

variable "password" {
  default = null
}

variable "grants" {
  default = {}
}

variable "roles" {
  default = []
}

variable "skip_reassign_owned" {
  default = true
}