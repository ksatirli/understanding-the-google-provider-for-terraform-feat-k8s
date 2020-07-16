provider "kubernetes" {
  load_config_file = false

  host                   = "https://${module.gke_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke_cluster.ca_certificate)
}

resource "kubernetes_namespace" "beacon" {
  metadata {
    name = "beacon"
  }
}

resource "kubernetes_deployment" "beacon" {
  metadata {
    name      = "beacon"
    namespace = kubernetes_namespace.beacon.id
    labels = {
      app = "beacon"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "beacon"
      }
    }

    template {
      metadata {
        labels = {
          app = "beacon"
        }
      }

      spec {
        container {
          image = "onlydole/beacon:1.19.1"
          name  = "beacon"
        }
      }
    }
  }
}

resource "kubernetes_service" "beacon" {
  metadata {
    name      = "beacon"
    namespace = kubernetes_namespace.beacon.id
  }
  spec {
    selector = {
      app = "${kubernetes_deployment.beacon.metadata.0.labels.app}"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
