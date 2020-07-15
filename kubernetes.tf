provider "kubernetes" {
  load_config_file = false

  host                   = "https://${module.hug_ist_gke_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = module.hug_ist_gke_cluster.ca_certificate
}
