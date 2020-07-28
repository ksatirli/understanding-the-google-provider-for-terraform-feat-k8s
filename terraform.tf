terraform {
  required_providers {
    google      = "~> 3.16"
    google-beta = "~> 3.29"
    http        = "~> 1.2"
    kubernetes  = "~> 1.11"
    null        = "~> 2.1"
  }

  required_version = "~> 0.12"
}
