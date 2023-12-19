variable "name" {}

variable "password" {
  default = null
}

variable "grants" {
  type = map(object({
    database    = string
    privileges  = string
    schema      = optional(string, "public")
    object_type = optional(string, "database")
  }))
  default = {}
}

variable "roles" {
  default = []
}

variable "skip_reassign_owned" {
  default = true
}