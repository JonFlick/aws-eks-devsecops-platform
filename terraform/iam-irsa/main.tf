terraform {
  backend "s3" {
    bucket         = "jonathanm-tfstate-devsecops-2026"
    key            = "iam-irsa/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "jonathanm-tfstate-devsecops-2026"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}

module "irsa_s3_readonly" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "app-s3-readonly"

  oidc_providers = {
    main = {
      provider_arn               = data.terraform_remote_state.eks.outputs.oidc_provider_arn
      namespace_service_accounts = ["default:app-service-account"]
    }
  }

  role_policy_arns = {
    s3_read = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }
}

output "irsa_role_arn" {
  value = module.irsa_s3_readonly.iam_role_arn
}
