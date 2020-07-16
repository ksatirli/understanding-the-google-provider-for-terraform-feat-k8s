terraform {
  required_providers {
    google      = "~> 3.16.0"
    google-beta = "~> 3.29.0"
    http        = "~> 1.2.0"
    kubernetes  = "~> 1.11.3"
    null        = "~> 2.1.2"
  }

  required_version = "~> 0.12.28"
}
