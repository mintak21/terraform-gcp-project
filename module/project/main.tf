## create gcp project
resource "google_project" "this" {
  name                = var.name
  project_id          = "${var.name}-${random_string.project_id_prefix.result}"
  billing_account     = var.billing_account_id
  auto_create_network = false
}

resource "google_project_default_service_accounts" "this" {
  project        = google_project.this.project_id
  action         = "DISABLE"
  restore_policy = "REVERT"

  depends_on = [
    google_project.this
  ]
}

## setup APIs
resource "google_project_service" "this" {
  count = length(var.enable_services)

  project                    = google_project.this.project_id
  service                    = var.enable_services[count.index]
  disable_dependent_services = true
  disable_on_destroy         = false

  depends_on = [
    google_project.this
  ]
}

## Cloud Registry
resource "google_container_registry" "this" {
  project  = google_project.this.project_id
  location = "US"

  depends_on = [
    google_project.this
  ]
}

resource "random_string" "project_id_prefix" {
  length  = 4
  upper   = false
  lower   = true
  number  = true
  special = false
}
