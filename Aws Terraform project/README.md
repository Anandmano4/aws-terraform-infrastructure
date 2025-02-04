# AWS Infrastructure Automation with Terraform

## Objective
This project aims to automate the deployment of AWS infrastructure using Terraform. The infrastructure includes a VPC, a subnet, a security group, and an EC2 instance.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html)
- AWS account
- AWS CLI configured with your credentials

## Steps to Use
1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/your-username/aws-terraform-infrastructure.git
    cd aws-terraform-infrastructure
    ```

2. Modify `terraform.tfvars` with your desired configuration, particularly the AMI ID.

3. Initialize the Terraform project:
    ```bash
    terraform init
    ```

4. Validate the configuration:
    ```bash
    terraform validate
    ```

5. Apply the configuration to deploy resources:
    ```bash
    terraform apply
    ```

    After deployment, Terraform will output the public IP of the EC2 instance.

6. To destroy the infrastructure, run:
    ```bash
    terraform destroy
    ```

## Notes
- The EC2 instance is configured with SSH access (port 22).
- Make sure to update the AMI ID in `terraform.tfvars` with an AMI available in your region.

## About This Project
This project demonstrates basic Terraform automation for AWS infrastructure. You can extend this by adding more resources, such as RDS instances, S3 buckets, Lambda functions, etc.
