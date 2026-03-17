output "upload_bucket" {
  value = aws_s3_bucket.upload.id
}

output "processed_bucket" {
  value = aws_s3_bucket.processed.id
}
