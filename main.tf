provider "aws" {
}

data "aws_cloudformation_stack" "serverless_prod" {
  name = "${var.serverless_service_name}-prod"
}

locals {
  api_url = data.aws_cloudformation_stack.serverless_prod.outputs["ServiceEndpoint"]
}

resource "aws_s3_bucket" "client" {
  bucket        = var.client_application_domain
  force_destroy = true

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "*"
        },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.client_application_domain}/*"
      }
    ]
  }
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = [local.api_url]
    expose_headers  = ["ETag"]
    max_age_seconds = 0
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 0
  }
}

output "client_application_domain_dns_cname" {
  value = aws_s3_bucket.client.website_endpoint
}

output "api_url" {
  value = local.api_url
}
