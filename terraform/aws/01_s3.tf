resource "aws_s3_bucket" "s3-bucket" {
  bucket = "gatsby-starter-eu-west-1-${terraform.workspace}"

  cors_rule {
    allowed_methods = [
    "GET"]
    allowed_origins = [
    "*"]
    allowed_headers = [
    "*"]
    max_age_seconds = 3000
    expose_headers = [
    "Content-Length"]
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.s3-bucket.id

  policy = jsonencode(
    {
      "Statement" : [
        {
          Action : "s3:GetObject",
          Effect : "Allow",
          Principal : "*",
          Resource : "${aws_s3_bucket.s3-bucket.arn}/*"
          Sid : "PublicReadGetObject"
        }
      ],
      "Version" : "2012-10-17"
    }
  )
}

resource "aws_s3_bucket" "s3-redirect-bucket" {
  bucket = "gatsby-starter-eu-west-1-${terraform.workspace}-redirect"

  acl = "private"

  website {
    redirect_all_requests_to = "https://${var.fe-url}"
  }
}
