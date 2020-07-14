module "hug_ist_gke_network" {
  source  = "terraform-google-modules/network/google"
  version = "2.4.0"

  project_id   = var.project_id
  network_name = "${var.project_prefix}-${random_string.suffix.result}"

  subnets = [
    {
      subnet_name   = "${var.project_prefix}-subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.project_region
      }, {
      subnet_name           = "${var.project_prefix}-subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.project_region
      subnet_private_access = true
    }
  ]
}
