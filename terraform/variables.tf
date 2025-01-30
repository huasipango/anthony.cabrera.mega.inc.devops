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

variable "kubernetes_host" {
  description = "GKE cluster host"
  type        = string
}

variable "kubernetes_token" {
  description = "GKE cluster token"
  type        = string
}

variable "kubernetes_cluster_ca_certificate" {
  description = "GKE cluster ca certificate"
  type        = string
} 