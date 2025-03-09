terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5.0"
    }
  }
}

provider "google" {
  credentials = var.gcp_credentials
  project     = "my-new-gke-project-452612"
  region      = "us-central1-a"
  zone        = "us-central1-a"
}

