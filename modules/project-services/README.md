# APIM – KMS / Apigee X / API hub (équipe OCP)

Une seule équipe ops génère les clés et provisionne les services.
Trois stacks, trois states, trois cycles de vie, un module partagé :

| # | Stack | Projet | Contenu |
|---|---|---|---|
| 1 | `kms/` | `ocp-core-security-npr` / `-prd` | Key rings + clés sur le single-tenant HSM, **uniquement** |
| 2 | `apigee-x/` | projet hôte `prj-...` | module `project-services` (APIs + service agent Apigee), droit sur **ses** clés, org Apigee X control plane only (fr / europe-west9) |
| 3 | `apihub/` | projet hôte `prj-...` | module `project-services` (APIs + service agent API hub), droit sur **sa** clé, instance API hub CMEK |

`modules/project-services/` : active les APIs d'un projet et crée le service agent d'un service.

## Ordre de provisioning

```
kms → apigee-x → apihub
```

Un seul `apply` par stack, sans `-target` ni bootstrap. Dans chaque dossier :

```bash
terraform init
terraform plan  -var-file=envs/hprd.tfvars
terraform apply -var-file=envs/hprd.tfvars
```

L'org Apigee X doit exister **avant** API hub : sinon API hub en crée une avec l'entitlement Cloud par défaut.

## Où les clés sont utilisées

| Clé | Stack | Paramètre Terraform | Consommateur |
|---|---|---|---|
| `apigee-<env>-consumer-data` | apigee-x | `api_consumer_data_encryption_key_name` | `service-<NUM>@gcp-sa-apigee` |
| `apigee-<env>-runtime-db` | apigee-x | `runtime_database_encryption_key_name` (immuable) | `service-<NUM>@gcp-sa-apigee` |
| `apihub-<env>` | apihub | `cmek_key_name` | `service-<NUM>@gcp-sa-apihub` |

Les IDs complets sont dans les `envs/*.tfvars` d'apigee-x et d'apihub.

## Droits du SA pipeline (équipe ops)

- Projet KMS : `roles/cloudkms.admin` + `cloudkms.singleTenantHsmInstances.get` / `.use` sur le HSM
- Projets `prj-...` : `roles/serviceusage.serviceUsageAdmin`, `roles/apigee.admin`, `roles/apihub.provisioningAdmin`, `roles/resourcemanager.projectIamAdmin`

## Prérequis

1. **Projets ajoutés au contrat Apigee par Google** (billing `SUBSCRIPTION`) avant l'apply d'apigee-x.
2. Org policies : europe-west9 autorisé, et europe-west1 (fallback Cloud Scheduler d'API hub).

## Points à valider avec Google

- Clés **single-tenant HSM** acceptées pour le CMEK Apigee et API hub.
- Juridiction `fr` : clé control plane non requise (elle ne s'applique qu'à eu/us).

## Points d'attention

- `prevent_destroy` sur les clés, l'org et l'instance.
- Clé API hub indisponible > 7 jours = données API hub supprimées définitivement.
- Un seul API hub par projet ; 7 jours d'attente après un déprovisioning.
