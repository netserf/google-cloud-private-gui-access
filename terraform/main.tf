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

resource "google_compute_instance" "tunnel_instance" {
  name         = "tunnel-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network    = var.network_name
    subnetwork = var.subnetwork_name
  }

  metadata_startup_script = file("${path.module}/startup.sh")
}

resource "google_compute_instance" "backend_instance" {
  name         = "backend-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network    = var.network_name
    subnetwork = var.subnetwork_name
  }

  metadata_startup_script = file("${path.module}/startup.sh")
}
