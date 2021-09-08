module "iam" {
  source          = "./modules/IAM"
  project_id      = var.project_id
  pub-sub-sa      = var.pub-sub-sa
  pub-sub-display = var.pub-sub-display
  pubsub-role     = var.pubsub-role
  storage-role    = var.storage-role

}

module "pubsub" {
  source     = "./modules/PubSub"
  topic_name = var.topic_name
  project_id = var.project_id
  subsc_name = var.subsc_name

}

module "vpc" {
  source            = "./modules/VPC"
  vpc_name          = var.vpc_name
  project_id        = var.project_id
  subnet_name       = var.subnet_name
  region            = var.region
  ip_ranges         = var.ip_ranges
  firewall_name     = var.firewall_name
  firewall_protocol = var.firewall_protocol
  firewall_port     = var.firewall_port

}

module "gce" {
  source       = "./modules/GCE"
  gce_name     = var.gce_name
  machine_type = var.machine_type
  zone         = var.zone
  gce_image    = var.gce_image
  subnet_name  = var.subnet_name
  custom_sa    = var.custom_sa

  depends_on = [module.vpc]

}

module "scheduler" {
  source                = "./modules/Scheduler"
  scheduler_name        = var.scheduler_name
  scheduler_description = var.scheduler_description
  schedule_value        = var.schedule_value
  tmz                   = var.tmz
  topic_id              = var.topic_id

  depends_on = [module.pubsub]

}
