terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.16.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "etags_bucket" {

}

resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.etags_bucket.id
    key = "testfile.txt"
    source = "testfile.txt"

    etag = filemd5("testfile.txt")
}