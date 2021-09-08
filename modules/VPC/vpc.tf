resource "google_compute_network" "vpc_network" {
  name    = var.vpc_name
  project = var.project_id

}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = var.vpc_name
  ip_cidr_range = var.ip_ranges
  depends_on    = [google_compute_network.vpc_network]

}

resource "google_compute_firewall" "ssh-access" {
  name    = var.firewall_name
  network = var.vpc_name
  allow {
    protocol = var.firewall_protocol
    ports    = [var.firewall_port]
  }

  depends_on = [google_compute_network.vpc_network]

}
