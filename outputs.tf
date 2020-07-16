output "beacon_url" {
  value = "${kubernetes_service.beacon.load_balancer_ingress.0.ip}:${kubernetes_service.beacon.spec.0.port.0.port}"
}
