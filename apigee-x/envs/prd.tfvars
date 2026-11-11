host_project_id        = "prj-ocp-apim-prd-apihub-x1d"
location               = "europe-west9"
control_plane_location = "fr"
billing_type           = "SUBSCRIPTION"
display_name           = "ocp-apim-prd-apihub"

# Sorties de la stack kms (prd) - projet KMS prd à confirmer
consumer_data_key_id = "projects/ocp-core-security-prd/locations/europe-west9/keyRings/kr-ocp-apigee-prd-consumer-data/cryptoKeys/key-ocp-apigee-prd-consumer-data"
runtime_db_key_id    = "projects/ocp-core-security-prd/locations/europe-west9/keyRings/kr-ocp-apigee-prd-runtime-db/cryptoKeys/key-ocp-apigee-prd-runtime-db"
