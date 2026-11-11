output "apigee_org_id" {
  description = "ID de l'org Apigee X"
  value       = google_apigee_organization.this.id
}

output "apigee_service_agent" {
  description = "Service agent Apigee (consommateur des clés)"
  value       = module.project_services.service_agent_email
}
