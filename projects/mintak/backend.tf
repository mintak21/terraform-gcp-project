terraform {
  backend "remote" {
    organization = "mintak21"

    workspaces {
      name = "gcp-projects-mintak"
    }
  }
}
