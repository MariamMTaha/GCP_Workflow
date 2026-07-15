terraform {
  backend "gcs" {
    bucket = "aip-state-bucket"
    prefix = "aip-demo"
  }
}
