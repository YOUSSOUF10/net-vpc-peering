terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }

  # backend "gcs" {
  #   bucket = "CHANGE_ME-tfstate"
  #   prefix = "kms/hprd"
  # }
}

provider "google" {
  project = var.kms_project_id
  region  = var.location
}
