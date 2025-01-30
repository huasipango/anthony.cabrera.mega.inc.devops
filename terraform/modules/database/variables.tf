variable "instance_name" {
  description = "Database instance name"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "network" {
  description = "VPC network ID"
  type        = string
}

variable "vpc_connection" {
  description = "VPC connection for dependency"
  type        = any
}

variable "db_username" {
  description = "Database user name"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
} 