terraform {
  backend "s3" {
    bucket = "dmj8682"
    key = "state"
    region = "us-east-1"
    dynamodb_table = "remote_backend"
  }

}