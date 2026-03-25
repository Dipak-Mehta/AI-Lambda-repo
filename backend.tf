#terraform {
#  backend "s3" {
#    bucket = "terraform-state-doc-platform"
#    key    = "doc-platform/terraform.tfstate"
#    region = "ap-south-1"
#  }
#}

#terraform {
#  backend "s3" {
#    bucket         = "my-personal-bucket-dipak"
#    key            = "env/${terraform.workspace}/terraform.tfstate"
#    region         = "ap-south-1"
#    encrypt        = true
#    dynamodb_table = "terraform-lock-table"
#  }
#}

terraform {
  backend "s3" {}
}
