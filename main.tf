module "api_gateway" {

  source = "./modules/api_gateway"

  prefix = local.prefix

  upload_lambda_arn   = module.lambda.upload_lambda_arn
  download_lambda_arn = module.lambda.download_lambda_arn
  fetch_lambda_arn    = module.lambda.fetch_lambda_arn
  search_lambda_arn   = module.lambda.search_lambda_arn
}

module "iam" {
  source = "./modules/iam"
  prefix = local.prefix
}

module "s3" {
  source = "./modules/s3"
  prefix = local.prefix
}

module "dynamodb" {
  source = "./modules/dynamodb"
  prefix = local.prefix
}

module "sqs" {
  source = "./modules/sqs"
  prefix = local.prefix
}

module "lambda" {
  source      = "./modules/lambda"
  prefix      = local.prefix
  lambda_role = module.iam.lambda_role_arn
  zip_file    = "lambda/upload.zip"
}

module "ses" {
  source       = "./modules/ses"
  email_sender = var.email_sender
  prefix = local.prefix
}

#module "sns" {
#  source = "./modules/sns"
#  prefix = local.prefix
#}
