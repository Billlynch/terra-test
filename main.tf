provider "aws" {
  region = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  skip_requesting_account_id = true

  endpoints {
    lambda = "http://localhost:4574"
    iam = "http://localhost:4593"
    stepfunctions = "http://localhost:4585"
    s3 = "http://localhost:4572"
  }
}



