terraform {
  backend "gcs" {
    bucket = "mirosh-tfstate-bucket"  # Replace with your actual GCS bucket name
    prefix = "terraform/state"
  }
}

resource "google_container_cluster" "gke_cluster" {
  name                    = "my-gke-cluster"
  location                = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count      = 1

  database_encryption {
    state = "DECRYPTED"
  }

  enable_shielded_nodes = false
}

# Custom Node Pool (Standard Disk)
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = google_container_cluster.gke_cluster.location
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
    disk_type    = "pd-standard"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

