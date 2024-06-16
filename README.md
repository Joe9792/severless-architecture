# Serverless Architecture on AWS with Terraform

This project sets up a serverless architecture on AWS using Terraform. It includes S3, Lambda, DynamoDB, RDS, API Gateway, and monitoring with CloudWatch and Slack notifications.

## Directory Structure

- `modules/`: Contains the Terraform modules for S3, Lambda, DynamoDB, RDS, API Gateway, and monitoring.
- `env/`: Contains environment-specific configurations for development and production.
- `variables.tf`: Defines variables used across the Terraform modules.
- `Jenkinsfile`: Jenkins pipeline configuration for CI/CD.
- `README.md`: This file.

## Setup

1. **Store Secrets in AWS Secrets Manager:**
   - Store the RDS password in AWS Secrets Manager.

2. **Configure Terraform:**
   - Ensure AWS credentials are configured.
   - Modify `variables.tf` with your specific values.

3. **Run Terraform:**
   - Initialize Terraform: `terraform init`
   - Plan the deployment: `terraform plan`
   - Apply the changes: `terraform apply`

4. **Setup Jenkins:**
   - Configure Jenkins with the provided `Jenkinsfile`.
   - Ensure Jenkins has access to AWS credentials and Slack webhook URL.

5. **Deploy:**
   - Use Jenkins to automate the deployment process.
