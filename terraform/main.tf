# VPC Network
resource "google_compute_network" "vpc" {
  name                    = "mg-inc-vpc"
  auto_create_subnetworks = false
}

# Subnet for GKE and Cloud SQL
resource "google_compute_subnetwork" "subnet" {
  name          = "mg-inc-subnet"
  ip_cidr_range = "10.0.0.0/16"
  network       = google_compute_network.vpc.id
  region        = var.region

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.0.0/18"
  }

  secondary_ip_range {
    range_name    = "service-ranges"
    ip_cidr_range = "192.168.64.0/18"
  }
}

# GKE Cluster
module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region
  network      = google_compute_network.vpc.name
  subnetwork   = google_compute_subnetwork.subnet.name
}

# Cloud SQL Instance
module "database" {
  source            = "./modules/database"
  instance_name     = var.db_instance_name
  region            = var.region
  network           = google_compute_network.vpc.id
}

# Redis Instance
module "redis" {
  source        = "./modules/redis"
  instance_name = var.redis_instance_name
  region        = var.region
  network       = google_compute_network.vpc.id
}

# Storage Bucket
resource "google_storage_bucket" "storage" {
  name          = "${var.project_id}-storage"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
} 