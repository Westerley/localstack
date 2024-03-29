terraform {
  required_providers {
    aws={
        source="hashicorp/aws"
        version="~> 3.27"
    }
  }
}

provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true
    endpoints {
      sns = "http://localhot:4566"
      s3 = "http://localhost:4566"
    }
  
}