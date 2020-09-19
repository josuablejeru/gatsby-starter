resource "aws_cloudfront_distribution" "site_distribution" {
  origin {
    domain_name = aws_s3_bucket.s3-bucket.bucket_domain_name
    origin_id   = aws_s3_bucket.s3-bucket.id
  }
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  aliases = [
    var.fe-url
  ]


  default_cache_behavior {

    compress = true

    lambda_function_association {
      event_type = "viewer-request"
      lambda_arn = aws_lambda_function.basic_auth.qualified_arn
    }

    allowed_methods = [
      "GET",
    "HEAD", ]
    cached_methods = [
      "GET",
    "HEAD", ]
    target_origin_id = aws_s3_bucket.s3-bucket.id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 172800
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

}

