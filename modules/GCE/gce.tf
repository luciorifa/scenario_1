resource "google_compute_instance" "vm_instance" {
  name         = var.gce_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.gce_image
    }
  }
  network_interface {
    subnetwork = var.subnet_name
    access_config {

    }
  }
  service_account {
    email  = var.custom_sa
    scopes = ["cloud-platform"]

  }

  metadata_startup_script = file("${path.module}/startup.sh")

}
