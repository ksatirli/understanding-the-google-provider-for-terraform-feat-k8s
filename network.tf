module "gke_network" {
  source  = "terraform-google-modules/network/google"
  version = "2.4.0"

  project_id   = var.project_id
  network_name = "${var.project_prefix}"

  subnets = [
    {
      subnet_name   = local.subnet_name
      subnet_ip     = "10.0.0.0/24"
      subnet_region = var.project_region
    },
  ]

  secondary_ranges = {
    "${local.subnet_name}" = [
      {
        range_name    = "${var.project_prefix}-ips-pods"
        ip_cidr_range = "10.1.0.0/16"
      },
      {
        range_name    = "${var.project_prefix}-ips-services"
        ip_cidr_range = "10.2.0.0/20"
      },
  ] }
}
