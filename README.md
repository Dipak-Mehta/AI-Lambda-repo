# 🚀 Terraform Document Platform

A **serverless document processing platform** built on AWS using Terraform.
This project provisions a scalable, event-driven architecture for handling document workflows efficiently.

---

## 🏗️ Architecture Overview

This solution leverages the following AWS services:

* ⚡ **AWS Lambda** – Serverless compute for document processing
* 🌐 **API Gateway** – REST API exposure
* 🪣 **S3** – File storage (upload & processed documents)
* 🧾 **DynamoDB** – Metadata storage
* 📬 **SQS** – Message queue for async processing
* 📧 **SES** – Email notifications
* 🔐 **IAM** – Secure access control

---

## 📌 Prerequisites

Before running Terraform, ensure:

* ✅ AWS CLI is configured

  ```bash
  aws configure
  ```
* ✅ Terraform is installed
* ✅ S3 bucket is created for remote state

Example:

```
my-personal-bucket-dipak
```

---

## 🔐 State Locking (One-time setup)

Create a DynamoDB table for Terraform state locking:

```bash
aws dynamodb create-table \
  --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region ap-south-1
```

---

## 📁 Backend Configuration

To store `terraform.tfstate` in S3, create the following files:

### 🔹 `env/dev-backend.hcl`

```hcl
bucket         = "my-personal-bucket-dipak"
key            = "env/dev/terraform.tfstate"
region         = "ap-south-1"
encrypt        = true
dynamodb_table = "terraform-lock-table"
```

### 🔹 `env/prod-backend.hcl`

```hcl
bucket         = "my-personal-bucket-dipak"
key            = "env/prod/terraform.tfstate"
region         = "ap-south-1"
encrypt        = true
dynamodb_table = "terraform-lock-table"
```

---

## 🌍 Workspace Management

Before applying Terraform, create and manage workspaces.

### ➕ Create workspace

```bash
terraform workspace new dev
```

### 📋 List workspaces

```bash
terraform workspace list
```

### 🔄 Switch workspace

```bash
terraform workspace select dev
```

---

## ✅ Validate Configuration

Always validate before deployment:

```bash
terraform validate
```

---

## 🚀 Deployment

### 🔹 DEV Environment

```bash
terraform init -reconfigure -backend-config="env/dev-backend.hcl"
terraform apply -var-file="env/dev.tfvars"
```

---

### 🔹 PROD Environment

```bash
terraform init -reconfigure -backend-config="env/prod-backend.hcl"
terraform apply -var-file="env/prod.tfvars"
```

---

## ⚠️ Important Notes

* 🔁 Always run `terraform init -reconfigure` when switching environments
* 🔍 Verify workspace before applying:

  ```bash
  terraform workspace show
  ```
* 🚫 Never mix **dev** and **prod** state
* 🔐 Keep backend config files secure

---

## 📦 Project Structure

```
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
```

---

## 🧠 Best Practices

* ✅ Enable versioning on S3 bucket
* ✅ Use DynamoDB for state locking
* ✅ Maintain separate environments (dev/prod)
* ✅ Avoid manual changes in AWS console
* ✅ Use proper naming conventions for resources

---

## 📈 Future Improvements

* CI/CD integration (GitHub Actions / Jenkins)
* Secrets management using AWS SSM / Secrets Manager
* Multi-account AWS setup for enhanced security

---

💡 *Tip: This setup is production-ready and scalable. Follow best practices to avoid state conflicts and ensure smooth deployments.*

