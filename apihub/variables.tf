variable "host_project_id" {
  description = "Projet hôte (contient déjà l'org Apigee X)"
  type        = string
}

variable "location" {
  description = "Région de l'instance API hub (= région de la clé)"
  type        = string
  default     = "europe-west9"
}

variable "api_hub_instance_id" {
  description = "ID de l'instance API hub"
  type        = string
}

variable "description" {
  description = "Description de l'instance API hub"
  type        = string
  default     = "Catalogue API hub - équipe OCP"
}

variable "disable_search" {
  description = "true = semantic search désactivée"
  type        = bool
  default     = true
}

variable "vertex_location" {
  description = "Multi-région des données de recherche (si disable_search = false)"
  type        = string
  default     = "eu"
}

variable "cmek_key_id" {
  description = "ID complet de la clé API hub (sortie de la stack kms)"
  type        = string
}
