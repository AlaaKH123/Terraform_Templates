terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "4.42.1"
    }
  }
}

provider "google" {
  project     = "my-first-project"
  region      = "us-central1"
  zone = "us-central1-a"
}