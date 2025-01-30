terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Obtener token de acceso para GKE
data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host  = "https://${module.gke.cluster_host}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      module.gke.cluster_ca_certificate
    )
  }
} 