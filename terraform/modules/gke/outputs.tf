output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_host" {
  value = google_container_cluster.primary.endpoint
} 