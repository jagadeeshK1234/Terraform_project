provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.website_domain
  region = "var.region"
  acl = "public-read"

    policy = <<POLICY
{
  "Version" : "2012-10-20",
  "Id" : "MyBucketPolicy",
  "Statement" :[
    {
      "Sid" : "PublicReadAccessForWebsite",
      "Effect" : "Allow",
      "Principal" : "*",
      "Action" : "s3:GetObject",
      "Resource" : ["arn:aws:s3:::${var.website_domain}/*"]
    }
  ]
}
POLICY
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  }
resource "aws_s3_bucket_object" "index.html" {
  bucket = var.website_domain
  key = "index.html"
  content_type = "text/html"

  source = "index.html"
}
resource "aws_s3_bucket_object" "error.html" {
  bucket = var.website_domain
  key = "error.html"
  content_type = "text/html"

  source = "error.html"
}

















