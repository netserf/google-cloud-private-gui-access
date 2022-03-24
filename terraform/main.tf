terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  // TODO: Add your GCP credentials, if outside Cloud Shell
}

data "google_billing_account" "acct" {
  display_name = var.billing_account_name
  open         = true
}

resource "google_project" "my_project" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = data.google_billing_account.acct.id
}

resource "google_compute_instance" "bastion" {
  name         = "bastion-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
