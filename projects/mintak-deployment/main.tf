module "mintak_deployment" {
  source = "../../module/project"

  name               = "mintak-deployment"
  billing_account_id = var.billing_account_id
}

variable "billing_account_id" {
  type        = string
  description = "set by tfvars"
}

output "project_id" {
  value = module.mintak_deployment.id
}
