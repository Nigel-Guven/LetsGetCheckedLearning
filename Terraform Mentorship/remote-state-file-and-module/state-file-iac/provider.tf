provider "aws" {
  region = "eu-west-1"
  profile = "default"

  access_key = "test"
  secret_key = "test"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
      sqs = "http://localhost:4566"
      sns   = "http://localhost:4566"
      dynamodb = "http://localhost:4566"
  }
}
