variable "tag" {
  type        = string
  default     = "16"
  description = "https://hub.docker.com/_/postgres/tags"
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "database" {
  type = string
}

variable "name" {
  type = string
}

variable "port" {
  type = number
}

variable "enable_pgadmin" {
  type    = bool
  default = false
}