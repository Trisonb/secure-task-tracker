terraform {
  backend "s3" {
    bucket         = "trison-terraform-state-1747864476"
    key            = "secure-task-tracker/terraform.tfstate"
    region         = "us-east-1"
    profile        = "prod-account"
  }
}

provider "aws" {
  region = "us-east-1"
}