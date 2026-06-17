# Terraform example for a conceptual Kubernetes cluster on AWS EKS.
# This file is intended as an Infrastructure as Code example for the Teilprüfung.
# It is not executed in GitHub Actions because a real AWS account, credentials,
# VPC, subnets and remote state backend would be required.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # In production, the Terraform state should be stored remotely.
  # Remote state enables collaboration, locking and recovery.
  # Example:
  #
  # backend "s3" {
  #   bucket         = "company-terraform-state"
  #   key            = "dev/eks/terraform.tfstate"
  #   region         = "eu-central-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
}

# Configure the AWS provider.
provider "aws" {
  region = "eu-central-1"
}

# Conceptual EKS cluster definition.
# In a real project, the VPC and subnet IDs would be provided as variables
# or created by another Terraform module.
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "microservices-dev-cluster"
  cluster_version = "1.29"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      min_size       = 1
      max_size       = 4
      instance_types = ["t3.medium"]
    }
  }
}

# Output the Kubernetes cluster endpoint.
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}