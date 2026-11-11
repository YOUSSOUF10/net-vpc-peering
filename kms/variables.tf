variable "kms_project_id" {
  description = "Projet qui porte les key rings et l'instance single-tenant HSM"
  type        = string
}

variable "location" {
  description = "Région des key rings (= région des consommateurs : Apigee X, API hub)"
  type        = string
  default     = "europe-west9"
}

variable "hsm_instance_name" {
  description = "Nom de l'instance single-tenant HSM"
  type        = string
}

variable "keys" {
  description = "Clés à créer. La clé de la map donne le nom : kr-ocp-<key> / key-ocp-<key>"
  type = map(object({
    rotation = optional(string, "7776000s") # 90 jours
  }))
}
