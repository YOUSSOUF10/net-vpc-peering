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
  #   prefix = "apigee-x/hprd"
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

# Endpoint régional de la juridiction de data residency (fr => fr-apigee.googleapis.com)
provider "google" {
  alias                  = "apigee_drz"
  project                = var.host_project_id
  region                 = var.location
  apigee_custom_endpoint = "https://${var.control_plane_location}-apigee.googleapis.com/v1/"
}
