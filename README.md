# Terraform AWS EKS Cluster Creation

This repository contains Terraform configurations to provision an Amazon Elastic Kubernetes Service (EKS) cluster on AWS. With this infrastructure as code (IaC), you can easily set up and manage an EKS cluster along with associated resources.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Terraform Configuration Files](#terraform-configuration-files)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

These instructions will guide you through deploying an EKS cluster using Terraform. Please follow the steps below to get started.

## Prerequisites

Before you begin, ensure you have the following prerequisites in place:

- AWS account with the necessary permissions.
- AWS CLI configured with your credentials.
- Terraform installed locally.

## Terraform Configuration Files

This repository includes several Terraform configuration files:

- `kubernetes.tf`: Contains Kubernetes-related configurations.
- `main.tf`: Main configuration file for AWS resources.
- `vpc.tf`: Defines the Virtual Private Cloud (VPC) for your EKS cluster.
- `eks-cluster.tf`: Specifies the EKS cluster itself.
- `security-groups.tf`: Configures security groups for network access.
- `rds.tf`: If applicable, includes configurations for Amazon RDS.

## Usage

To deploy your EKS cluster, follow these steps:

1. Clone this repository to your local machine.
   ```
   git clone  https://github.com/Radeeka/terraform_eks_cluster.git
   ```

2. Change into the cloned directory.
   ```
   cd terraform_eks_cluster
   ```

3. Initialize the Terraform workspace.
   ```
   terraform init
   ```

4. Review and customize the Terraform variables and configurations in the `.tf` files as needed.

5. Plan the Terraform deployment to verify your changes.
   ```
   terraform plan
   ```

6. Apply the changes to create your EKS cluster.
   ```
   terraform apply
   ```

7. Follow any additional prompts or instructions provided during the deployment process.

## Customization

You can customize the Terraform configurations to suit your specific requirements. Refer to the individual `.tf` files for details on each resource's configuration options.

## Contributing

We welcome contributions to enhance and improve this Terraform project. If you encounter issues or have suggestions, please open an issue or submit a pull request following our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE), which means you are free to use, modify, and distribute the code as per the terms of the license.

---
