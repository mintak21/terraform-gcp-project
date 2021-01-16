variable "name" {
  type        = string
  description = "プロジェクト名称"
}

variable "billing_account_id" {
  type = string
  description = "請求先アカウントID"
}

variable "enable_services" {
  type        = list(string)
  description = "接続許可するIPアドレスリスト"
  default = [
    "iam.googleapis.com",               # Identity and Access Management (IAM) API
    "storage-component.googleapis.com", # Cloud Storage API
    "compute.googleapis.com",           # Compute Engine API
    "cloudbuild.googleapis.com",        # Cloud Build API
    "container.googleapis.com",         # Kubernetes Engine API
  ]
}
