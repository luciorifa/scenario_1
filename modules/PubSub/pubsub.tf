resource "google_pubsub_topic" "demo-pubsub-topic" {
  name    = var.topic_name
  project = var.project_id
}

resource "google_pubsub_subscription" "demo-subscription" {
  name  = var.subsc_name
  topic = google_pubsub_topic.demo-pubsub-topic.name

}
