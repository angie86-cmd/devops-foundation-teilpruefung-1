# VPC ID used by the conceptual EKS cluster.
variable "vpc_id" {
  description = "ID of the VPC where the Kubernetes cluster should be deployed."
  type        = string
}

# Private subnets used by the conceptual EKS worker nodes.
variable "private_subnet_ids" {
  description = "Private subnet IDs used by the Kubernetes cluster."
  type        = list(string)
}