module "mintak" {
  source = "../../module/project"

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
