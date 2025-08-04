resource "aws_s3_bucket" "my-s3-bucket" {
}

variable "tags" {
  description = "A map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

    versioning {
        enabled = var.versioning
    }
     
    tags = var.tags
    }

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl           = var.acl

  versioning {
    enabled = true
  }

  tags = var.tags
}

