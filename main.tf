provider "aws" {
  region = var.aws_region
}

module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source           = "./modules/lambda"
  lambda_name      = var.lambda_name
  lambda_zip_path  = var.lambda_zip_path
  lambda_role_arn  = module.iam.lambda_exec_role_arn
  bucket_arn       = module.s3.bucket_arn
  env_vars         = var.lambda_env_vars
}

module "s3" {
  source            = "./modules/s3"
  bucket_name       = var.bucket_name
  lambda_arn        = module.lambda.lambda_arn
  lambda_permission = module.lambda.lambda_permission
}
