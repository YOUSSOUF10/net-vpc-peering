############################################
# 1. APIs + service agent Apigee (module)
############################################

module "project_services" {
  source = "../modules/project-services"

  project_id = var.host_project_id
  services = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "apigee.googleapis.com",
  ]
  service_agent_for = "apigee.googleapis.com"
}

############################################
# 2. Accès du service agent Apigee à ses clés (projet KMS)
############################################

resource "google_kms_crypto_key_iam_member" "apigee" {
  for_each = {
    consumer_data = var.consumer_data_key_id
    runtime_db    = var.runtime_db_key_id
  }

  crypto_key_id = each.value
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = module.project_services.service_agent_member
}

############################################
# 3. Org Apigee X : control plane uniquement (pas d'instance runtime)
############################################
# À provisionner AVANT API hub : API hub réutilisera cette org.
# Prérequis : projet ajouté au contrat par Google + clés créées (stack kms).

resource "google_apigee_organization" "this" {
  provider = google.apigee_drz

  project_id   = var.host_project_id
  display_name = var.display_name
  description  = "Org Apigee X (control plane only) - support API hub - équipe OCP"

  runtime_type        = "CLOUD"
  billing_type        = var.billing_type
  disable_vpc_peering = true # pas d'instance, pas de réseau

  # Data residency : pas d'analytics_region
  api_consumer_data_location            = var.location
  api_consumer_data_encryption_key_name = var.consumer_data_key_id
  runtime_database_encryption_key_name  = var.runtime_db_key_id
  control_plane_encryption_key_name     = var.control_plane_key_id

  depends_on = [google_kms_crypto_key_iam_member.apigee]

  lifecycle {
    prevent_destroy = true
  }
}
