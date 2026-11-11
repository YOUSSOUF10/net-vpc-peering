variable "host_project_id" {
  description = "Projet hôte (le même que celui d'API hub)"
  type        = string
}

variable "location" {
  description = "Région des données API consumer (= région des clés)"
  type        = string
  default     = "europe-west9"
}

variable "control_plane_location" {
  description = "Juridiction du control plane Apigee (fr = europe-west9 uniquement)"
  type        = string
  default     = "fr"
}

variable "billing_type" {
  description = "SUBSCRIPTION = couverte par le contrat"
  type        = string
  default     = "SUBSCRIPTION"
}

variable "display_name" {
  description = "Nom d'affichage de l'org Apigee"
  type        = string
  default     = null
}

# ---------- Clés (sorties de la stack kms) ----------

variable "consumer_data_key_id" {
  description = "ID complet de la clé API consumer data"
  type        = string
}

variable "runtime_db_key_id" {
  description = "ID complet de la clé runtime DB (immuable après création)"
  type        = string
}

variable "control_plane_key_id" {
  description = "Clé control plane : juridictions multi-région (eu/us) uniquement. null pour fr."
  type        = string
  default     = null
}
