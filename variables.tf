variable "aws_region" {
  default = "eu-west-1"
}

variable "bucket_name" {
  default = "xfarm-csv-processing-bucket"
}

variable "lambda_name" {
  default = "xfarmCsvProcessor"
}

variable "lambda_zip_path" {
  default = "lambda_function_payload.zip"
}

variable "lambda_env_vars" {
  type = map(string)
  default = {}
}
