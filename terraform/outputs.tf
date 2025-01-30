output "kubernetes_cluster_name" {
  value       = module.gke.cluster_name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = module.gke.cluster_host
  description = "GKE Cluster Host"
}

output "redis_instance_host" {
  value       = module.redis.instance_host
  description = "Redis instance IP"
}

output "database_instance_connection_name" {
  value       = module.database.instance_connection_name
  description = "Cloud SQL instance connection name"
}

output "database_instance_ip" {
  value       = module.database.instance_ip
  description = "Cloud SQL instance IP"
} 