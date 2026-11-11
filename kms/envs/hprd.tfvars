kms_project_id    = "ocp-core-security-npr"
location          = "europe-west9"
hsm_instance_name = "ocp-core-shared-hsm-npr"

keys = {
  "apigee-hprd-consumer-data" = {} # org Apigee X : données API consumer
  "apigee-hprd-runtime-db"    = {} # org Apigee X : base runtime (immuable)
  "apihub-hprd"               = {} # instance API hub
}
