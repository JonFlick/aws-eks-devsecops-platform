terraform {
  backend "s3" {
    bucket         = "jonathanm-tfstate-devsecops-2026"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
