variable "project_id" {
  type        = string
  description = "Project Identifier"
  default     = "hc-da-test"
}

variable "project_region" {
  type        = string
  description = "Project Region"
  default     = "us-west2" # Los Angeles, CA, USA
}

resource "random_string" "suffix" {
  length  = 3
  special = false
  upper   = false
}

variable "project_prefix" {
  type        = string
  description = "Project Prefix"
  default     = "hug-ist-demo"
}
# get your public IP address by querying ICHI
data "http" "icanhazip" {
  # this value will be available in data.http.icanhazip.body
  url = "https://icanhazip.com/"
}
