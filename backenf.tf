terraform {
    backend "s3" {
        bucket         = "my-dev-tf-state-bucketss"
        key            = "main/terraform.tfstate"
        region         = "us-east-2"
         acl    = "private"
        use_lockfile  = true
        encrypt        = true
    }
}