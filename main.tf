provider "aws" {
  region = var.user_region
}

terraform {
  backend "s3" {}
}