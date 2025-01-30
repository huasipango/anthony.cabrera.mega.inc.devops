resource "google_redis_instance" "cache" {
  name           = var.instance_name
  tier           = "BASIC"
  memory_size_gb = 1

  region        = var.region
  location_id   = "${var.region}-a"

  authorized_network = var.network

  redis_version     = "REDIS_6_X"
  display_name      = "MG Inc Redis Cache"

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"
      start_time {
        hours = 2
        minutes = 0
        seconds = 0
        nanos = 0
      }
    }
  }
} 