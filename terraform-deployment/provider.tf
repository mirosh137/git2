terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5.0"
    }
  }
}

provider "google" {
  project     = "my-new-gke-project-452612"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("C:\\Users\\danik\\my-new-gke-project-452612-ceb1f0c738c4.json")
}


