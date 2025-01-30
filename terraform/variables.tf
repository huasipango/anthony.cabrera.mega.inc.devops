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
  default     = "mg-inc-cluster"
}

variable "db_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "mg-inc-postgres"
}

variable "redis_instance_name" {
  description = "Redis instance name"
  type        = string
  default     = "mg-inc-redis"
} 