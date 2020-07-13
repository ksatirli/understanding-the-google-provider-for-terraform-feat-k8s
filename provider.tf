provider "google" {
  # credentials are inferred from the environment through `gcloud auth login`
  # credentials = file("google_cloud_credentials.json")

  # optional, may also be configured via `gcloud config set project <project ID>`
  project     = "hc-da-test"

  # see https://cloud.google.com/compute/docs/regions-zones for more information
  region      = "us-west2" # Los Angeles, CA, USA
}
