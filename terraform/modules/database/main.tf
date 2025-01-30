resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  region           = var.region
  database_version = "POSTGRES_13"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = true
      private_network = var.network
    }

    backup_configuration {
      enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = "mg_inc_db"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "users" {
  name     = "mg_inc_user"
  instance = google_sql_database_instance.instance.name
  password = "changeme123"  # En producción usar secret manager
} 