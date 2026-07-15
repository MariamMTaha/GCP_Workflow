provider "google" {
  project = var.project_id
  region  = var.region
}
data "google_compute_network" "demo_vcn" {
  name    = "vpc-test-mariam"
  project = var.project_id
}

data "google_compute_subnetwork" "demo_subnet" {
  name    = "sb-aip-test"
  region  = var.region
  project = var.project_id
}

resource "google_compute_instance" "vm" {
  name         = "demo-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.demo_subnet.id
  }

}
