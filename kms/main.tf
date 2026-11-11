############################################
# Clés CMEK sur le single-tenant HSM
############################################
# Stack sans dépendance : elle crée les clés, uniquement.
# Les droits d'usage (encrypterDecrypter) sont posés par chaque stack
# consommatrice (apigee-x, apihub) pour son propre service agent.
#
# À VÉRIFIER avec la version du provider : crypto_key_backend et HSM_SINGLE_TENANT.

locals {
  hsm_backend = "projects/${var.kms_project_id}/locations/${var.location}/singleTenantHsmInstances/${var.hsm_instance_name}"
}

resource "google_kms_key_ring" "this" {
  for_each = var.keys

  project  = var.kms_project_id
  name     = "kr-ocp-${each.key}"
  location = var.location
}

resource "google_kms_crypto_key" "this" {
  for_each = var.keys

  name               = "key-ocp-${each.key}"
  key_ring           = google_kms_key_ring.this[each.key].id
  purpose            = "ENCRYPT_DECRYPT"
  rotation_period    = each.value.rotation
  crypto_key_backend = local.hsm_backend

  version_template {
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "HSM_SINGLE_TENANT"
  }

  lifecycle {
    prevent_destroy = true
  }
}
