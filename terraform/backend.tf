terraform {
  backend "s3" {
    bucket         = "jenkins111"
    key            = "myfile.stfile"
    region         = "us-east-1"
    dynamodb_table = "lock"
    profile        = "default"
  }

}
