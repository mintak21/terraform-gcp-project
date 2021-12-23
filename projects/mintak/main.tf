module "mintak" {
  source = "github.com/mintak21/terraform-modules.git//gcp/project?ref=v0.3.3"

  name                   = "mintak"
  authorize_github_owner = "mintak21"
  billing_account_id     = var.billing_account_id
}

resource "google_project_iam_member" "github_actions" {
  project = module.mintak.project_id
  role    = "roles/editor" // FIXME 本来は個別に権限をふるべき
  member  = "serviceAccount:${module.mintak.service_account_github_actions_email}"
}

variable "billing_account_id" {
  type        = string
  description = "set by tfvars"
}

output "project_id" {
  value = module.mintak.project_id
}

output "service_account_mintak_github_email" {
  value = module.mintak.service_account_github_actions_email
}

output "iam_workload_identity_pool_provider_mintak_name" {
  value = module.mintak.google_iam_workload_identity_pool_provider_github_name
}
