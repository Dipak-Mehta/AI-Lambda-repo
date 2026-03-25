Terraform Document Platform

Serverless document processing platform using AWS.

This project provisions a complete document processing system using:

AWS Lambda
API Gateway
S3
DynamoDB
SQS
SES
IAM
📌 Prerequisites

Before running Terraform, ensure:

AWS CLI is configured (aws configure)
Terraform is installed

S3 bucket is created for remote state
Example:

my-personal-bucket-dipak
🔐 State Locking (One-time setup)

Create a DynamoDB table for Terraform state locking:

aws dynamodb create-table \
  --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region ap-south-1
📁 Backend Configuration

To store terraform.tfstate in S3, create backend config files:

env/dev-backend.hcl
bucket         = "my-personal-bucket-dipak"
key            = "env/dev/terraform.tfstate"
region         = "ap-south-1"
encrypt        = true
dynamodb_table = "terraform-lock-table"
env/prod-backend.hcl
bucket         = "my-personal-bucket-dipak"
key            = "env/prod/terraform.tfstate"
region         = "ap-south-1"
encrypt        = true
dynamodb_table = "terraform-lock-table"
🌍 Workspace Management

Before applying Terraform on any server, create and manage workspaces.

Create new workspace
terraform workspace new dev
List all workspaces
terraform workspace list
Switch workspace
terraform workspace select dev
✅ Validate Configuration

Before applying, always validate:

terraform validate
🚀 Deployment Commands
🔹 DEV Environment
terraform init -reconfigure -backend-config="env/dev-backend.hcl"
terraform apply -var-file="env/dev.tfvars"
🔹 PROD Environment
terraform init -reconfigure -backend-config="env/prod-backend.hcl"
terraform apply -var-file="env/prod.tfvars"
⚠️ Important Notes
Always run terraform init -reconfigure when switching environments

Ensure correct workspace before applying:

terraform workspace show
Never mix dev and prod state
Keep backend config files secure
📦 Project Structure (Overview)
.
├── env/
│   ├── dev.tfvars
│   ├── prod.tfvars
│   ├── dev-backend.hcl
│   └── prod-backend.hcl
├── modules/
├── lambda/
├── main.tf
├── variables.tf
├── outputs.tf
└── backend.tf
🧠 Best Practices
Enable versioning on S3 bucket
Use DynamoDB for state locking
Use separate environments for dev and prod
Avoid manual changes in AWS console
