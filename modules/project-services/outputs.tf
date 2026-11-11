output "service_agent_email" {
  description = "Email du service agent (service-<NUM>@gcp-sa-<service>.iam.gserviceaccount.com)"
  value       = google_project_service_identity.this.email
}

output "service_agent_member" {
  description = "Membre IAM du service agent"
  value       = "serviceAccount:${google_project_service_identity.this.email}"
}
