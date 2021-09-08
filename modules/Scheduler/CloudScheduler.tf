resource "google_cloud_scheduler_job" "job" {
  name        = var.scheduler_name
  description = var.scheduler_description
  schedule    = var.schedule_value
  time_zone   = var.tmz

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = var.topic_id
    data       = base64encode("test")
  }
}
