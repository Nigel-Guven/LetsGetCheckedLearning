provider "aws" {
  region = "eu-west-1"
  profile = "default"
  
  alias = "dev"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
}

provider "aws" {
  region = "eu-west-1"
  profile = "default"
  
  alias = "prod"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
}