provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-xpe-jb"
    key    = "state/xpe/edc/mod1/terraform.tfstate"
    region = "us-east-1"
  }
}
