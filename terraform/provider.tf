provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terraform"
}

# this will be used for the acm certificate
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# TODO: Document it in REAMDE
provider "github" {
  token = "${var.github_token}"
  owner = "${var.github_owner}"
}

terraform {
  backend "s3" {
    bucket = "gatsby-starter-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
