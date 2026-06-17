# DevOps Foundation – Teilprüfung 1

This repository contains the technical implementation examples used for DevOps Foundation Teilprüfung 1.

The goal of this repository is to document a realistic CI/CD and DevOps workflow for a containerized microservice architecture running on Kubernetes. The repository includes a minimal Node.js microservice, a Dockerfile, GitHub Actions workflows, Terraform examples, Kubernetes manifests, and a GitOps example using Argo CD.

## Scope

This repository demonstrates the following DevOps concepts:

- Continuous Integration and Continuous Delivery with GitHub Actions
- Automated unit testing
- Docker image build for a microservice
- Simulated quality and security checks
- Simulated deployment to a Kubernetes test environment
- Infrastructure as Code with Terraform
- Kubernetes configuration using manifests
- Configuration Management using ConfigMaps
- GitOps principles using Argo CD
- Repository-based documentation and traceability

## Repository Structure

```text
devops-foundation-teilpruefung-1
├── app
│   ├── app.js
│   ├── test.js
│   ├── package.json
│   └── Dockerfile
├── .github
│   └── workflows
│       └── ci-cd-pipeline.yml
├── terraform
│   └── eks-concept
│       ├── main.tf
│       └── variables.tf
├── kubernetes
│   ├── base
│   │   ├── deployment.yml
│   │   ├── service.yml
│   │   └── configmap.yml
│   └── environments
│       ├── dev
│       ├── staging
│       └── production
├── gitops
│   └── argocd-application-dev.yml
├── screenshots
├── pdf
├── README.md
└── .gitignore
```

## Minimal Microservice

The `app` folder contains a minimal Node.js microservice used to validate the CI/CD pipeline.

The application consists of:

- `app.js`: minimal HTTP server
- `test.js`: simple unit test
- `package.json`: Node.js metadata and scripts
- `Dockerfile`: container image definition

The unit test verifies that the microservice module can be loaded successfully.

## CI/CD Pipeline

The GitHub Actions workflow is located under:

```text
.github/workflows/ci-cd-pipeline.yml
```

The pipeline includes the following steps:

1. Checkout source code
2. Set up Node.js
3. Install dependencies
4. Run unit tests
5. Simulate code quality checks
6. Build a Docker image
7. Run unit tests inside the Docker image
8. Simulate security scanning
9. Simulate pushing the image to a container registry
10. Simulate deployment to a Kubernetes test environment
11. Simulate deployment notification

Some steps are simulated because this learning repository does not use a real container registry, Kubernetes cluster, cloud account, or notification service.

## Infrastructure as Code

Terraform is used as the selected Infrastructure as Code tool.

The Terraform example is located under:

```text
terraform/eks-concept
```

It describes a conceptual Kubernetes cluster on AWS EKS. The example is not executed automatically because a real AWS account, credentials, network configuration, remote backend, and Kubernetes cluster would be required.

The purpose of the Terraform example is to show how infrastructure can be described, versioned, reviewed, and managed as code.

## Kubernetes Manifests

The Kubernetes manifests are located under:

```text
kubernetes/base
```

They include:

- `deployment.yml`: desired state of the microservice workload
- `service.yml`: stable internal network endpoint
- `configmap.yml`: non-sensitive runtime configuration

These files represent the desired application state that can be versioned in Git and synchronized into a Kubernetes cluster.

## Configuration Management

The example uses Kubernetes ConfigMaps to separate configuration from the container image.

This supports environment-specific configuration without rebuilding the Docker image. Sensitive values should be managed with Kubernetes Secrets or external secret management solutions.

Ansible can complement this approach for bootstrap tasks, host configuration, or external system preparation. In a Kubernetes-native microservice setup, however, runtime configuration is typically managed through Kubernetes resources, Helm values, Kustomize overlays, or GitOps workflows.

## GitOps Example

The GitOps example is located under:

```text
gitops/argocd-application-dev.yml
```

The example uses Argo CD as a GitOps controller.

In this model:

- GitHub acts as the versioned source of truth.
- Kubernetes manifests describe the desired state.
- Argo CD continuously compares the desired state in Git with the actual state in the cluster.
- If drift is detected, Argo CD can synchronize the cluster back to the desired state.

## Notes

This repository is intended for learning and documentation purposes.

The CI/CD pipeline is executable in GitHub Actions, while the infrastructure and GitOps examples are conceptual and documented as part of the Teilprüfung. This separation avoids requiring paid cloud resources while still showing how the concepts would be applied in a professional DevOps environment.