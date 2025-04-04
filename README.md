# xFarm – CSV Processing Pipeline with Terraform

## 📌 Architecture Overview

This project provisions a simple and secure AWS-based pipeline using Terraform. The architecture responds to a common data ingestion use case:

- 📤 A CSV file is uploaded to an **S3 Bucket**
- ⚡ That triggers an **AWS Lambda** function
- 🔍 The Lambda processes the file contents (e.g., reads or parses it)

## 🛠️ Technologies

- **Terraform** (local backend)
- **AWS Lambda** (Python 3.12)
- **S3 with event triggers**
- **IAM Roles (least privilege)**

---

## 🚀 Deployment Instructions

### 1. Clone the repo

git clone git@github.com:zunderStake/xFarm.git

cd xFarm

### 2. Package the Lambda function
cd lambda
zip ../lambda_function_payload.zip handler.py
cd ..

### 3. Initialize and deploy
terraform init
terraform plan
terraform apply

---

## ⚙️Environment Configuration
All variables are defined in terraform.tfvars, like:

- **bucket_name = "xfarm-csv-processing-bucket"**
- **lambda_name = "xfarmCsvProcessor"**
- **lambda_zip_path = "lambda_function_payload.zip"**

## 🔐 Security Best Practices Applied

- Least privilege IAM role for Lambda
- S3 versioning and server-side encryption (AES-256)
- Modularized Terraform code (clean structure)
- Environment variables supported via Terraform

## 📦 Project Structure
├── lambda/                  → Python function<br>
├── modules/<br>
│   ├── iam/                 → IAM role & policies<br>
│   ├── lambda/              → Lambda + permissions<br>
│   └── s3/                  → S3 bucket + event trigger<br>
├── main.tf<br>
├── variables.tf<br>
├── outputs.tf<br>
├── terraform.tfvars<br>
└── README.md
