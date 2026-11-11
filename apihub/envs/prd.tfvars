host_project_id     = "prj-ocp-apim-prd-apihub-x1d"
location            = "europe-west9"
api_hub_instance_id = "apihub-prd"
description         = "Catalogue API hub prod - équipe OCP"
disable_search      = true

# Sortie de la stack kms (prd) - projet KMS prd à confirmer
cmek_key_id = "projects/ocp-core-security-prd/locations/europe-west9/keyRings/kr-ocp-apihub-prd/cryptoKeys/key-ocp-apihub-prd"
