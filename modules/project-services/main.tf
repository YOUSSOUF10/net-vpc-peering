############################################
# Module : activation des APIs + création du service agent
############################################
# Activer une API (ex : apigee.googleapis.com) ne crée aucune ressource
# facturable : seule la création de l'org / de l'instance compte.

resource "google_project_service" "this" {
  for_each = toset(var.services)

  project            = var.project_id
  service            = each.key
  disable_on_destroy = false
}

# google_project_service_identity n'existe que dans google-beta
resource "google_project_service_identity" "this" {
  provider = google-beta

  project = var.project_id
  service = var.service_agent_for

  depends_on = [google_project_service.this]
}
