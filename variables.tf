variable "project_id" {
  type        = string
  description = "Project Identifier"
  default     = "hc-da-test"
}

variable "project_region" {
  type        = string
  description = "Project Region"
  default     = "us-west2" # Los Angeles, CA, USA
}

resource "random_string" "suffix" {
  length  = 3
  special = false
  upper   = false
}

variable "project_prefix" {
  type        = string
  description = "Project Prefix"
  default     = "hug-ist-demo"
}

locals {
  subnetwork_names = keys(module.hug_ist_gke_network.subnets)

  # use the lookup function to find the key at index 0 of `subnet_names` (see previous line),
  # then use this key to retrieve the data of that specific subnet from `module.hug_ist_gke_network.subnets`

  # Please note: While this approach is entirely codified, it is not necessarily the easiest code to read or maintain;
  # if you want to understand this better, check out `outputs.tf`. Uncomment all `outputs` and run `terraform apply`.
  # The outputs are built to take you step-by-step from the first value to the last one, as shown in the next four lines:
  subnetwork_services_name          = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[0], null), "name", null)
  subnetwork_services_ip_cidr_range = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[0], null), "ip_cidr_range", null)

  subnetwork_pods_name          = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[1], null), "name", null)
  subnetwork_pods_ip_cidr_range = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[1], null), "ip_cidr_range", null)
}

# get your public IP address by querying ICHI
data "http" "icanhazip" {
  # this value will be available in data.http.icanhazip.body
  url = "https://icanhazip.com/"
}
