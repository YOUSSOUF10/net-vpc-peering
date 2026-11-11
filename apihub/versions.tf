terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.0"
    }
  }

  # backend "gcs" {
  #   bucket = "CHANGE_ME-tfstate"
  #   prefix = "apihub/hprd"
  # }
}

provider "google" {
  project = var.host_project_id
  region  = var.location
}

provider "google-beta" {
  project = var.host_project_id
  region  = var.location
}
