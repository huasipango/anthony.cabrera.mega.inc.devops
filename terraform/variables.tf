variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
  default     = "challenge-cluster"
}

variable "db_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "challenge-postgres"
}

variable "redis_instance_name" {
  description = "Redis instance name"
  type        = string
  default     = "challenge-redis"
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