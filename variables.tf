variable "aws_region"{
    description = "the aws region to create things in."
    default     = "us-east-2"

}

variable "key_name" {
    description = "SSH keys to connect to ec2 instance"
    default     = "jerkin-key-pair"
}
variable "ami_id" {
    description = "AMI ID to use for the EC2 instance"
    default     = "ami-0c55b159cbfafe1f0"  # Example AMI ID, replace with a valid one
}

variable "instance_type" {
    description = "Instance type for the EC2 instance"
    default     = "t2.micro"
}

variable "my_security_group" {

 description = "The value for the Name tag of the security group"
    type        = string
}

variable "security_group" {
  description = "The name of the security group"
  type        = string
}

variable tag_name {
    description = "Tag name for the EC2 instance"
    default     = "my-ec2-instance"
}

variable "versioning"{
    type        = bool
    description = "option to enable versioning on the s3 bucket"
    default     = true
}

variable "bucket_prefix" {
    type        = string
    description = "Prefix for the S3 bucket name"
    default     = "my-s3-bucket-"
}

variable "acl" {
    type        = string
    description = "Access control list for the S3 bucket"
    default     = "private"
}
variable "tags" {
    type        = map
    description = "Tags to apply to the S3 bucket"
    default     = {
        Environment = "DE"
        terraform   = "true"
    }
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
}