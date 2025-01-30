resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  region           = var.region
  database_version = "POSTGRES_15"

  depends_on = [var.vpc_connection]

  settings {
    tier = "db-f1-micro"
    disk_size = 10

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network
      require_ssl     = true
    }

    backup_configuration {
      enabled = true
    }

    disk_size = 10
    disk_type = "PD_SDD"
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = "challenge_db"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "users" {
  name     = var.db_username
  instance = google_sql_database_instance.instance.name
  password = var.db_password
} 