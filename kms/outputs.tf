output "key_ids" {
  description = "IDs complets des clés, à reporter dans les tfvars Apigee X / API hub"
  value       = { for k, v in google_kms_crypto_key.this : k => v.id }
}
