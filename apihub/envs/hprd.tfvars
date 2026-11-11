host_project_id     = "prj-ocp-apim-hprd-apihub-y7h"
location            = "europe-west9"
api_hub_instance_id = "apihub-hprd"
description         = "Catalogue API hub hors prod - équipe OCP"
disable_search      = true

# Sortie de la stack kms (hprd)
cmek_key_id = "projects/ocp-core-security-npr/locations/europe-west9/keyRings/kr-ocp-apihub-hprd/cryptoKeys/key-ocp-apihub-hprd"
