output "instance_connection_name" {
  value = google_sql_database_instance.instance.connection_name
}

output "instance_ip" {
  value = google_sql_database_instance.instance.ip_address.0.ip_address
} 