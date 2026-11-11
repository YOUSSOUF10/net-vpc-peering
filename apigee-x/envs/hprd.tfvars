host_project_id        = "prj-ocp-apim-hprd-apihub-y7h"
location               = "europe-west9"
control_plane_location = "fr"
billing_type           = "SUBSCRIPTION"
display_name           = "ocp-apim-hprd-apihub"

# Sorties de la stack kms (hprd)
consumer_data_key_id = "projects/ocp-core-security-npr/locations/europe-west9/keyRings/kr-ocp-apigee-hprd-consumer-data/cryptoKeys/key-ocp-apigee-hprd-consumer-data"
runtime_db_key_id    = "projects/ocp-core-security-npr/locations/europe-west9/keyRings/kr-ocp-apigee-hprd-runtime-db/cryptoKeys/key-ocp-apigee-hprd-runtime-db"
