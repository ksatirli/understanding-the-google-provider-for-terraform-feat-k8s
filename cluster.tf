module "hug_ist_gke_cluster" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "10.0.0"

  //  add_cluster_firewall_rules = true
  //  create_service_account     = false
  description = "GKE Demonstration for HUG Istanbul"
  //  firewall_inbound_ports     = []
  gcloud_skip_download  = false
  gcloud_upgrade        = true
  grant_registry_access = true
  //  horizontal_pod_autoscaling = false
  //  http_load_balancing        = false
  initial_node_count     = 0
  ip_range_pods          = local.subnetwork_pods_name
  ip_range_services      = local.subnetwork_services_name
  kubernetes_version     = "1.16.10-gke.8"
  logging_service        = "logging.googleapis.com/kubernetes"
  monitoring_service     = "monitoring.googleapis.com/kubernetes"
  maintenance_start_time = "03:00"
  master_authorized_networks = [
    {
      cidr_block   = local.subnetwork_services_ip_cidr_range
      display_name = "Services Subnet"
      }, {
      cidr_block   = local.subnetwork_pods_ip_cidr_range
      display_name = "Pods Subnet"
      }, {
      cidr_block   = "${chomp(data.http.icanhazip.body)}/32"
      display_name = "Operator"
  }]

  name    = "${var.project_prefix}-${random_string.suffix.result}"
  network = module.hug_ist_gke_network.network_name
  //  network_policy = false
  //  node_pools               = []
  project_id = var.project_id
  region     = var.project_region
  //  regional   = true
  //  remove_default_node_pool = true
  subnetwork = module.hug_ist_gke_network.subnets_names[0]
}

data "google_client_config" "default" {}
