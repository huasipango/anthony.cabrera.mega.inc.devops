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