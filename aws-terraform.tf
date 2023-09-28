terraform {
  backend "s3" {
    bucket = "NAME_OF_THE_BUCKET"
    key = "PATH_TO_TERRAFORM_STATE_FILE"
    region = "us-east-1"
    dynamodb_table = "state-locking"
  }
}