// Allows to authenticate with AWS account
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
