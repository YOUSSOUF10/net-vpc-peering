variable "project_id" {
  description = "Projet hôte dans lequel activer les APIs"
  type        = string
}

variable "services" {
  description = "APIs à activer"
  type        = list(string)
}

variable "service_agent_for" {
  description = "Service dont on crée le service agent (ex : apigee.googleapis.com)"
  type        = string
}
