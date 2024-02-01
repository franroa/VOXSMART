terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "franroatestbucket"
    key            = "test"
    region         = "eu-west-1"
    dynamodb_table = "my-terraform-lock-table" # NOTE: we lock the state file on dynamodb to prevent concurrent writes. Also, that way we have backup
    encrypt        = true
  }
}
