resource "google_service_account" "custom_user" {
  account_id   = var.pub-sub-sa
  display_name = var.pub-sub-display

}

resource "google_project_iam_member" "pubsub-role" {
  project = var.project_id
  role    = var.pubsub-role
  member  = "serviceAccount:${google_service_account.custom_user.email}"

}

resource "google_project_iam_member" "storage-role" {
  project = var.project_id
  role    = var.storage-role
  member  = "serviceAccount:${google_service_account.custom_user.email}"

}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.custom_user.name

}
