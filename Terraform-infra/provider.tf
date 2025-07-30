provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-k8s-state-bucket"
    key            = "k8s/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-k8s-locks"
    encrypt        = true
  }
}
