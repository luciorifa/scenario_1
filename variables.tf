//General project variables
variable "project_id" {

}

variable "region" {

}

variable "credentials_file" {

}
//IAM variables with pubsub and storage roles
variable "pub-sub-sa" {

}

variable "pub-sub-display" {

}

variable "pubsub-role" {

}

variable "storage-role" {

}

variable "topic_name" {

}
//VPC, Subnet and Firewall variables
variable "subsc_name" {

}

variable "vpc_name" {

}

variable "subnet_name" {

}

variable "ip_ranges" {

}

variable "firewall_protocol" {

}

variable "firewall_port" {

}

variable "firewall_name" {

}
//Cloud Compute Engine variables
variable "gce_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "machine_type" {

}

variable "zone" {

}

variable "gce_image" {

}

variable "custom_sa" {

}

//Cloud Scheduler variables

variable "scheduler_name" {

}

variable "scheduler_description" {

}

variable "schedule_value" {

}

variable "tmz" {

}

variable "topic_id" {

}
