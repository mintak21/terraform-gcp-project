module "mintak" {
  source = "github.com/mintak21/terraform-modules/gcp/project"

  name               = "mintak"
  billing_account_id = var.billing_account_id
}

variable "billing_account_id" {
  type        = string
  description = "set by tfvars"
}

output "project_id" {
  value = module.mintak.id
}
