output "apihub_instance_name" {
  description = "Nom complet de l'instance API hub"
  value       = google_apihub_api_hub_instance.this.name
}

output "apihub_service_agent" {
  description = "Service agent API hub (consommateur de la clé)"
  value       = module.project_services.service_agent_email
}
