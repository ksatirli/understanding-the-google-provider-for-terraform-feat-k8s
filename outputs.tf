output "subnets" {
  value = module.hug_ist_gke_network.subnets
}

output "subnetwork_names" {
  value = local.subnetwork_names
}

output "subnetwork_name_services" {
  value = local.subnetwork_names[0]
}

output "subnetwork_names_pods" {
  value = local.subnetwork_names[1]
}

output "subnetwork_services" {
  value = lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[0], null)
}

output "subnetwork_services_name" {
  value = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[0], null), "name", null)
}

output "subnetwork_pods_name" {
  value = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[1], null), "name", null)
}

output "subnetwork_services_ip_cidr_range" {
  value = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[0], null), "ip_cidr_range", null)
}

output "subnetwork_pods_ip_cidr_range" {
  value = lookup(lookup(module.hug_ist_gke_network.subnets, local.subnetwork_names[1], null), "ip_cidr_range", null)
}
