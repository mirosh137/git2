variable "credentials_file" {
  default = "C:/Users/danik/Downloads/my-gke-project-451415-e4339559a5f8.json"
}

variable "region" {
  description = "The GCP region where resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for Compute instances"
  type        = string
  default     = "us-central1-a"
}


variable "github_repo_url" {
  description = "GitHub repository URL for CI/CD setup (not used in GKE cluster creation)"
  type        = string
  default     = "https://github.com/mirosh137/git2.git"
}


