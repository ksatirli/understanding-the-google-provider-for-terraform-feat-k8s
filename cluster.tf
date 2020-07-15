module "hug_ist_gke_cluster" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "10.0.0"

  add_cluster_firewall_rules        = true
  create_service_account            = true
  description                       = "GKE Demonstration for HUG Istanbul"
  disable_legacy_metadata_endpoints = true
  horizontal_pod_autoscaling        = true
  ip_range_pods                     = module.hug_ist_gke_network.subnets_secondary_ranges[0].*.range_name[0]
  ip_range_services                 = module.hug_ist_gke_network.subnets_secondary_ranges[0].*.range_name[1]

  firewall_inbound_ports = [
    "8080"
  ]


  master_authorized_networks = [
    {
      cidr_block   = module.hug_ist_gke_network.subnets_ips[0]
      display_name = "VPC"
    }, {
      cidr_block   = "${chomp(data.http.icanhazip.body)}/32"
      display_name = "Operator"
    }
  ]

  name           = "${var.project_prefix}-cluster-${var.project_region}-${random_string.suffix.result}"
  network        = module.hug_ist_gke_network.network_name
  network_policy = true

  node_pools = [
    {
      name               = "default"
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 1
      disk_size_gb       = 100
      disk_type          = "pd-ssd"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = false
      preemptible        = false
      initial_node_count = 1
    }
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]

    default = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  node_pools_labels = {
    all     = {}
    default = {}
  }

  node_pools_metadata = {
    all     = {}
    default = {}
  }

  node_pools_tags = {
    all     = []
    default = []
  }

  project_id               = var.project_id
  region                   = var.project_region
  regional                 = true
  remove_default_node_pool = true
  service_account          = "create"
  subnetwork               = module.hug_ist_gke_network.subnets_names[0]
}

data "google_client_config" "default" {}
