provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "coodesh-bucket"
  acl    = "public-read"
  tags = {
    Name = "My S3 Bucket"
  }

  # website {
  #   index_document = "index.html"
  # }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "index.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "PublicReadGetObject",
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject"
        ],
        Resource = [
          "${aws_s3_bucket.bucket.arn}/*"
        ]
      }
    ]
  })
}
