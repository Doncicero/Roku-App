provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "<your_bucket_name>"
  acl    = "private"  # Access Control List. You can change it to "public-read" or "public-read-write" as needed.

  # Enable versioning for the S3 bucket (optional)
  versioning {
    enabled = true
  }

  # Enable server-side encryption (optional)
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Bucket tags (optional)
  tags = {
    Name = "Example S3 Bucket"
    Environment = "Development"
  }
}






