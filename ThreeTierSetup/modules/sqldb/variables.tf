

variable "resource_group_name" {
  description = "RG name"
}

variable "location" {
  description = "location of webapp"
}

variable "sql_server_name" {
  type        = string
  default     = "tech-challenge-db-server"
  description = "(optional) describe your variable"
}
variable "sql_db_name" {
  type        = string
  default     = "tech-challenge-db"
  description = "(optional) describe your variable"
}

variable "sql_admin_login" {
  type        = string
  default = "administrator92"
  description = "sql login "
}
variable "sql_admin_password" {
  type = string
  description = "sql login password"
}